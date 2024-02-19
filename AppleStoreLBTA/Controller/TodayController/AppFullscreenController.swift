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
        setupFloatingControls()
    }
    
    
    @objc fileprivate func handleTap() {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
            self.floatingContainerView.transform = .init(translationX: 0, y: -500)
        }
        
    }
    
    let floatingContainerView = UIView()

    let height = UIApplication.shared.statusBarHeight

    fileprivate func setupFloatingControls() {
        
        view.addSubview(floatingContainerView)
        floatingContainerView.layer.cornerRadius = 16
        floatingContainerView.clipsToBounds = true
        floatingContainerView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: -96, right: 16), size: .init(width: 0, height: 96))
        
        let blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        floatingContainerView.addSubview(blurVisualEffectView)
        blurVisualEffectView.fillSuperview()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
        imageView.layer.cornerRadius = 8
        imageView.constrainHeight(constant: 72)
        imageView.constrainWidth(constant: 72)
        
        let appLabel = UILabel()
        appLabel.text = "Life Hack"
        appLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let descLabel = UILabel()
        descLabel.text = "Utilizing your time"
        descLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        let getButton = UIButton()
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.white, for: .normal)
        getButton.layer.cornerRadius = 18
        getButton.constrainWidth(constant: 72)
        getButton.constrainHeight(constant: 36)
        getButton.backgroundColor = #colorLiteral(red: 0.3411764503, green: 0.3411764503, blue: 0.3411764503, alpha: 1)
        
        let verticalStackView = UIStackView(arrangedSubviews: [appLabel, descLabel])
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [imageView, verticalStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        floatingContainerView.addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 8, right: 16))
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        
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
        
        print(scrollView.contentOffset.y)
  
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
            
            
            self.floatingContainerView.transform = scrollView.contentOffset.y > 100 ? .init(translationX: 0, y: -90 - self.height) : .identity
            
//            if scrollView.contentOffset.y > 100 {
//                self.floatingContainerView.transform = .init(translationX: 0, y: -90 - self.height)
//            } else {
//                self.floatingContainerView.transform = .identity
//            }
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

extension UIApplication {
    var statusBarHeight: CGFloat {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .compactMap {
                $0.statusBarManager
            }
            .map {
                $0.statusBarFrame
            }
            .map(\.height)
            .max() ?? 0
    }
}
