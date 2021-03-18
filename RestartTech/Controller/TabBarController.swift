//
//  TabBarController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 18/03/2021.
//

import UIKit
import Foundation
import FanMenu
import Macaw

@IBDesignable
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
        let fanMenu = FanMenu()
        
//        fanMenu.layer.cornerRadius = 30
        
        fanMenu.button = FanMenuButton(
            id: "main",
            image: UIImage(named: "bellman_bottom-icon"),
            color: Color(val: 0x7c93fe)
        )
        
//        fanMenu.menuRadius = 90
        
        fanMenu.items = [
            FanMenuButton(id: "hotspots", image: UIImage(named: "hotspot_icon"), color: Color(val: 0x7c93fe), title: "Hotspots", titleColor: Color(val: 0x7c93fe), titlePosition: .bottom),
            FanMenuButton(id: "Events", image: UIImage(named: "events_icon"), color: Color(val: 0x7c93fe), title: "Hotspots", titleColor: Color(val: 0x7c93fe), titlePosition: .bottom)
        ]
        
        fanMenu.onItemDidClick = { button in
            print("ItemDidClick = \(button.id)")
        }
        
        fanMenu.onItemWillClick = { button in
            print("ItemWillClick = \(button.id)")
        }
        
        
        // Button Customization
//        middleBtn.setImage(UIImage(named: "bellman_bottom-icon"), for: .normal)
        
        // Register the button and the tap event
        self.tabBar.addSubview(fanMenu)
//        middleBtn.addTarget(self, action: #selector(self.menuButtonTapped), for: .touchUpInside)
        
        fanMenu.translatesAutoresizingMaskIntoConstraints = false
        fanMenu.backgroundColor = .clear
        
//        fanMenu.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        fanMenu.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        fanMenu.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        fanMenu.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
//        fanMenu.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        
        fanMenu.frame.origin = self.view.bounds.origin
        
        
//        NSLayoutConstraint.activate([
//            fanMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            fanMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            fanMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
//            fanMenu.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
//        ])
    }
    
    @objc func menuButtonTapped(sender: UIButton) {
        // What will happen when the middle buttonis tapped
        print("Floating Button Tapped")
    }
}
