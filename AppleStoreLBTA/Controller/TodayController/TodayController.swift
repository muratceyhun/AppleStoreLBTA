//
//  TodayController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    
    var todayItems = [TodayItem]()
    
    var group1: TopFreeApps?
    var group2: TopFreeApps?
    
    
    let activityIndicator: UIActivityIndicatorView = {
        let aI = UIActivityIndicatorView(style: .large)
        aI.startAnimating()
        aI.hidesWhenStopped = true
        return aI
    }()
    
    let blurVisualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    fileprivate func setupBlurVision() {
        view.addSubview(blurVisualEffect)
        blurVisualEffect.fillSuperview()
        blurVisualEffect.alpha = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupBlurVision()
        collectionView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.self.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        fetchItems()
        
    }
    
    fileprivate func fetchItems() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopPaidApps { topPaidApps, err in
            
            if let err = err {
                print("Failed to get top paid apps", err)
            }
            
            self.group1 = topPaidApps
            dispatchGroup.leave()
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchTopBooks { topFreeBooks, err in
            
            if let err = err {
                print("Failed to get top free books", err)
            }
            
            self.group2 = topFreeBooks
            dispatchGroup.leave()
        }
        
        
        dispatchGroup.notify(queue: .main) {
            
            self.todayItems =
            
            [
                TodayItem(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize yor life the right way.", color: .white, cellType: .single, apps: []),
                TodayItem(category: "THE DAILY LIST", title: self.group1?.feed.title ?? "", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize yor life the right way.", color: .white, cellType: .multiple, apps: self.group1?.feed.results ?? []),
                
                TodayItem(category: "THE DAILY LIST", title: "Top Free Books", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize yor life the right way.", color: .white, cellType: .multiple, apps: self.group2?.feed.results ?? []),
                
                TodayItem(category: "HOLIDAYS", title: "Travel on a Budget", image: #imageLiteral(resourceName: "holiday"), description: "Find out all you need to know on how to travel without packing everything!", color: #colorLiteral(red: 0.9838810563, green: 0.9640342593, blue: 0.7226806879, alpha: 1), cellType: .single, apps: [])
            ]
            
            self.collectionView.reloadData()
        }
        
    }
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
        //        navigationController?.navigationBar.isHidden = true
        //        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    fileprivate func createBarrierView(color: UIColor) {
        let vw = UIView()
        vw.backgroundColor = color
        view.addSubview(vw)
        vw.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor)
    }
    
    var appFullscreenController: AppFullscreenController!
    var startingFrame: CGRect?
  
    
    class SpecialNavController: UINavigationController {
        override var prefersStatusBarHidden: Bool {
            return true
        }
    }
    
    
    fileprivate func showingFullscreenAppController(indexPath: IndexPath) {
        
        let vc = TodayMultipleAppController(mode: .fullscreen)
        vc.topPaidApp = todayItems[indexPath.item].apps
        let navVc = SpecialNavController(rootViewController: vc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
        return
    }
    
    
    fileprivate func setupSingleTodayAppCell(_ indexPath: IndexPath) {
            
        
        collectionView.isUserInteractionEnabled = false
        
        let todayItem = todayItems[indexPath.item]
        
        let appFullscreenController = AppFullscreenController()
        
        appFullscreenController.todayItem = todayItem
        
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        
        appFullscreenController.view.addGestureRecognizer(gesture)
        gesture.delegate = self
        appFullscreenController.dismissHandler = {
            self.handleRemoveFullScreenView()
        }
        
        
        appFullscreenController.view.layer.cornerRadius = 16
        self.appFullscreenController = appFullscreenController

    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: appFullscreenController.view).y

        if gesture.state == .changed {
            let scale = 1 - translation / 1000
            self.appFullscreenController.view.transform = CGAffineTransform(scaleX: scale, y: scale)
        } else if gesture.state == .ended {
            handleRemoveFullScreenView()
            appFullscreenController.appFullscreenHeaderCell.closeButton.isHidden = true
        }
        
     
        
    }
    
    
    fileprivate func setupStartingCellFrame(_ indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
    }
    
    
    fileprivate func setupSingleTodayAppCellStartingPosition(_ indexPath: IndexPath) {
        
        addChild(appFullscreenController)
        
        let fullScreenView = appFullscreenController.view!
        view.addSubview(fullScreenView)
        
        setupStartingCellFrame(indexPath)
        
        guard let startingFrame = self.startingFrame else {return}
        
        self.anchoredConstraints = fullScreenView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: startingFrame.origin.y, left: startingFrame.origin.x, bottom: 0, right: 0), size: .init(width: startingFrame.width, height: startingFrame.height))
        
        self.view.layoutIfNeeded()
        
        let fullScreenCell = appFullscreenController.tableView.cellForRow(at: [0,0]) as! AppFullscreenHeaderCell
        fullScreenCell.todayCell.topConstraint.constant = 88
        
        
        fullScreenCell.layoutIfNeeded()
        
    }
    
    var anchoredConstraints: AnchoredConstraints?
    
    fileprivate func beginFullscreenAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut) {
            self.blurVisualEffect.alpha = 1
            self.anchoredConstraints?.top?.constant = 0
            self.anchoredConstraints?.leading?.constant = 0
            self.anchoredConstraints?.width?.constant = self.view.frame.width
            self.anchoredConstraints?.height?.constant = self.view.frame.height

            self.view.layoutIfNeeded()  // This fires off the animation...
                        
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height
            
        } completion: { _ in
            
        }
        
    }
    
    fileprivate func showingSingleTodayCell(indexPath: IndexPath) {
        
        
        // #1 setupSingleAppCell
        setupSingleTodayAppCell(indexPath)
        
        
        // #2 setupStartingPosition
        setupSingleTodayAppCellStartingPosition(indexPath)
        
        // # begin fullscreen animation
        
        beginFullscreenAnimation()
        
        
        
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch todayItems[indexPath.item].cellType {
        case .multiple:
            showingFullscreenAppController(indexPath: indexPath)
        default:
            showingSingleTodayCell(indexPath: indexPath)
        }
    }
    
    fileprivate func handleRemoveFullScreenView() {
        
        self.view?.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
            
            
            self.view?.layoutIfNeeded()
            guard let startingFrame = self.startingFrame else {return}
            self.appFullscreenController.view.transform = .identity
            self.blurVisualEffect.alpha = 0

            self.anchoredConstraints?.top?.constant = startingFrame.origin.y
            self.anchoredConstraints?.leading?.constant = startingFrame.origin.x
            self.anchoredConstraints?.width?.constant = startingFrame.width
            self.anchoredConstraints?.height?.constant = startingFrame.height
            
            self.appFullscreenController.tableView.showsVerticalScrollIndicator = false
            self.appFullscreenController.tableView.showsHorizontalScrollIndicator = false
            
            self.view?.layoutIfNeeded()
            
            let fullScreenCell = self.appFullscreenController.tableView.cellForRow(at: [0,0]) as! AppFullscreenHeaderCell
            fullScreenCell.todayCell.topConstraint.constant = 24
            
            fullScreenCell.layoutIfNeeded()
            
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            
        } completion: { _ in
            self.appFullscreenController.view.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
            
        }
        
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if todayItems.count != 0 {
            activityIndicator.stopAnimating()
        }
        
        
        return todayItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = todayItems[indexPath.item].cellType.rawValue
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BaseTodayCell
        
        cell.todayItem = self.todayItems[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 32, right: 0)
    }
}
