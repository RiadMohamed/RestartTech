//
//  TabBarController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 18/03/2021.
//

import UIKit
import FanMenu


class TabBarController: UITabBarController, UITabBarControllerDelegate {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
//    @IBSegueAction func showFAB(_ coder: NSCoder) -> UIViewController? {
//        let fab = FAB()
////        return UIHostingController(coder: coder, rootView: fab)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
//        self.tabBar.itemWidth = 10
//        self.tabBar.itemPositioning = .fill
//        self.tabBar.itemSpacing = 140
    }
    
    func setupMiddleButton() {
        // Create the button
        
        
        // Button Customization
//        middleBtn.setImage(UIImage(named: "bellman_bottom-icon"), for: .normal)
        
        // Register the button and the tap event
//        self.tabBar.addSubview(fanMenu)
//        middleBtn.addTarget(self, action: #selector(self.menuButtonTapped), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonTapped(sender: UIButton) {
        // What will happen when the middle buttonis tapped
        print("Floating Button Tapped")
    }
}
