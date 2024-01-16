//
//  TodayMultipleAppController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 13.01.2024.
//

import UIKit


class TodayMultipleAppController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
   
    
    var topPaidApp: [AppResults]?
    
    
    
    var mode: Mode
    
    enum Mode {
        case small
        case fullscreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close_button"), for: .normal)
        button.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleCloseButton() {
        dismiss(animated: true)
    }
    
    
    let multipleAppListCellID = "multipleAppListCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MultipleAppListCell.self, forCellWithReuseIdentifier: multipleAppListCellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        if mode == .fullscreen {
            setupCloseButton()
            return
        }
        
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 36, left: 0, bottom: 0, right: 20), size: .init(width: 48, height: 48))
    }
    

    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if mode == .fullscreen {
            return topPaidApp?.count ?? .zero
        } else {
           return 4
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleAppListCellID, for: indexPath) as! MultipleAppListCell
        
        guard let topPaidApp = topPaidApp else {return cell}
        cell.topPaidApp = topPaidApp[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if mode == .small {
            let height = (view.frame.height - 3 * spacing) / 4
            return .init(width: view.frame.width, height: height)
        } else {
            return .init(width: view.frame.width - 48, height: 70)
        }
        
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    let spacing: CGFloat = 16
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    
}
