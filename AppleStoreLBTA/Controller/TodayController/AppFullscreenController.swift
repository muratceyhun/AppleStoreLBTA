//
//  AppFullscreenController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit


class AppFullscreenController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todayItem: TodayItem?
    
    var dismissHandler: (() -> ())?
    
    let appFullscreenHeaderCell = AppFullscreenHeaderCell()

    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close_button"), for: .normal)
        button.constrainWidth(constant: 48)
        button.constrainHeight(constant: 48)
        return button
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        setupCloseButton()
    }
    
    fileprivate func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 88, left: 0, bottom: 0, right: 16))
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.isScrollEnabled = false
            scrollView.isScrollEnabled = true
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            appFullscreenHeaderCell.todayCell.todayItem = todayItem
            
            
            return appFullscreenHeaderCell
        } else {
            let cell = AppFullscreenDescriptionCell()
            return cell
        }
        
    }
    
    @objc fileprivate func handleCloseButton(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
    

    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 500
        } else {
            return UITableView.automaticDimension
        }
    }
        
    
}
