//
//  TabBarController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 18/03/2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
//        self.tabBar.isTranslucent = true
        UITabBar.appearance().backgroundImage = UIImage()
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().clipsToBounds = true
    }
    
    func setupMiddleButton() {
        // Create the button
        let middleBtn = UIButton(frame: CGRect(x: ((self.view.bounds.width/2)-25), y: -20, width: 50, height: 50))
        
        // Button Customization
        middleBtn.setImage(UIImage(named: "bellman_bottom-icon"), for: .normal)
        
        // Register the button and the tap event
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonTapped), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonTapped(sender: UIButton) {
        // What will happen when the middle buttonis tapped
        print("Floating Button Tapped")
    }
}
