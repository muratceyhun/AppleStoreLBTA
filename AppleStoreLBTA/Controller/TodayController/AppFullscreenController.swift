//
//  AppFullscreenController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 8.01.2024.
//

import UIKit


class AppFullscreenController: UITableViewController {
    
    var todayItem: TodayItem?
    
    var dismissHandler: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
    }
    

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let appFullscreenHeaderCell = AppFullscreenHeaderCell()
            appFullscreenHeaderCell.todayCell.todayItem = todayItem
            appFullscreenHeaderCell.closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
            
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
    

    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 450
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
        
    
}
