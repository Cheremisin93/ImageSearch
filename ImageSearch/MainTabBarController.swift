//
//  MainTabBarController.swift
//  ImageSearch
//
//  Created by Cheremisin Andrey on 18.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        
        
        
        viewControllers = [generateNavigationController(rootViewController: photosVC, title: "Images", image: UIImage(named: "photos")!),
                           generateNavigationController(rootViewController: ViewController(), title: "Favorites", image: UIImage(named: "heart")!)]
        
    }
    
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
    
}
