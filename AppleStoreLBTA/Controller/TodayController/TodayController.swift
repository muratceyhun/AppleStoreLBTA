//
//  TodayController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    
    
    let todayCellID = "todayCellID"
    
    var todayItems =
    
    [
        TodayItem(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize yor life the right way.", color: .white),
        TodayItem(category: "HOLIDAYS", title: "Travel on a Budget", image: #imageLiteral(resourceName: "holiday"), description: "Find out all you need to know on how to travel without packing everything!", color: #colorLiteral(red: 0.9838810563, green: 0.9640342593, blue: 0.7226806879, alpha: 1))
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellID)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.isHidden = true
//        navigationController?.setNavigationBarHidden(true, animated: true)
    }
        
    var appFullscreenController: AppFullscreenController!
    var startingFrame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let todayItem = todayItems[indexPath.item]
        
        
        
        let appFullscreenController = AppFullscreenController()
        
        appFullscreenController.todayItem = todayItem
    
        
        appFullscreenController.dismissHandler = {
            self.handleRemoveFullScreenView()
        }
    
        self.appFullscreenController = appFullscreenController
        addChild(appFullscreenController)
        
        let fullScreenView = appFullscreenController.view!
        
        fullScreenView.layer.cornerRadius = 16
        view.addSubview(fullScreenView)
        
        
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
        
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach{$0?.isActive = true}
        
        self.view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut) {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()  // This fires off the animation...
            
            
            
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height
            
        } completion: { _ in
            
        }
        
        
    }
    
     fileprivate func handleRemoveFullScreenView() {
        
        self.view?.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
            
            
            self.view?.layoutIfNeeded()
            guard let startingFrame = self.startingFrame else {return}
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.appFullscreenController.tableView.showsVerticalScrollIndicator = false
            self.appFullscreenController.tableView.showsHorizontalScrollIndicator = false
            
            self.view?.layoutIfNeeded()
            
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            
        } completion: { _ in
            self.appFullscreenController.view.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
            
        }
        
    }
    

    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellID, for: indexPath) as! TodayCell
        let todayItem = todayItems[indexPath.item]
        cell.todayItem = todayItem
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 32, right: 0)
    }
}
