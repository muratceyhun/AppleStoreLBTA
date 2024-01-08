//
//  TodayController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit


class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    
    let todayCellID = "todayCellID"
    
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
        
    var startingFrame: CGRect?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let redView = UIView()
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        redView.backgroundColor = .red
        redView.layer.cornerRadius = 16
        view.addSubview(redView)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
//        redView.frame = cell.frame//This is not working very  well, you should use absolute coordinates of cell
        
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
        
        redView.frame = startingFrame
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6) {
            redView.frame = self.view.frame
        } completion: { _ in
    
        }


    }
    
    @objc fileprivate func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
            
            guard let startingFrame = self.startingFrame else {return}
            
            gesture.view?.frame = startingFrame

        } completion: { _ in
            gesture.view?.removeFromSuperview()

        }

    }
    

    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellID, for: indexPath)
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
