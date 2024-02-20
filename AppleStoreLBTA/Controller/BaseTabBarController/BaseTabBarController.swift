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
        

//        let todayController = UIViewController()
//        todayController.view.backgroundColor = .white
//        todayController.navigationItem.title = "Today"
//        let navTodayController = UINavigationController(rootViewController: todayController)
//        navTodayController.navigationBar.prefersLargeTitles = true
//        navTodayController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
//        navTodayController.tabBarItem.title = "Today"
//
//        navTodayController.navigationBar.scrollEdgeAppearance = navBarAppearance
//        navTodayController.navigationBar.standardAppearance = navBarAppearance
        
        
        
        viewControllers =
        
        [
            createNavController(viewController: MusicController(), navBartitle: "Music", tabBarTitle: "Today", imageName: "music"),
            createNavController(viewController: TodayController(), navBartitle: "Today", tabBarTitle: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsController(), navBartitle: "Apps", tabBarTitle: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), navBartitle: "Search", tabBarTitle: "Search", imageName: "search")
        ]
    }
    
    
    fileprivate func createNavController(viewController: UIViewController, navBartitle: String, tabBarTitle: String, imageName: String) -> UINavigationController {
        let vc = viewController
        vc.view.backgroundColor = .white
        vc.navigationItem.title = navBartitle
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = tabBarTitle
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.standardAppearance = appearance
        
        return navController
    }
    
}
