//
//  BaseTabBarController.swift
//  AppleStoreLBTA
//
//  Created by Murat Ceyhun Korpeoglu on 26.12.2023.
//

import UIKit


class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
//        tabBarAppearance.configureWithOpaqueBackground()
//        tabBarAppearance.configureWithTransparentBackground()
//        tabBarAppearance.backgroundColor = .green ----> To change all tab bar's color

        
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        
//        tabBar.tintColor = .yellow
        
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        
//        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        self.navigationController?.navigationBar.compactAppearance = navBarAppearance
        

        
        
        let redVC = UIViewController()
        redVC.navigationItem.title = "Apps"
        redVC.view.backgroundColor = .white
        let redNavCont = UINavigationController(rootViewController: redVC)
        redNavCont.navigationBar.prefersLargeTitles = true
        redNavCont.tabBarItem.title = "Apps"
        redNavCont.tabBarItem.image = #imageLiteral(resourceName: "apps")
        
        redNavCont.navigationBar.standardAppearance = navBarAppearance
        redNavCont.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        
        
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = .white
        blueVC.navigationItem.title = "Search"
        let blueNavCont = UINavigationController(rootViewController: blueVC)
        blueNavCont.navigationBar.prefersLargeTitles = true
        blueNavCont.tabBarItem.title = "Search"
        blueNavCont.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        blueNavCont.navigationBar.standardAppearance = navBarAppearance
        blueNavCont.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        viewControllers =
        [
            redNavCont,
            blueNavCont
           
        ]
        
        
        
    }
    
    
    
}
