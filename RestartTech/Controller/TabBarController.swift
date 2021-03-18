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
        let fanMenu = FanMenu(frame: CGRect(x: ((self.view.bounds.width/2)-30), y: -30, width: 60, height: 60))
        
        fanMenu.layer.cornerRadius = 30
        
        fanMenu.button = FanMenuButton(
            id: "main",
            image: UIImage(named: "bellman_bottom-icon"),
            color: Color(val: 0x7c93fe)
        )
        
        fanMenu.menuRadius = 90
        
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
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonTapped(sender: UIButton) {
        // What will happen when the middle buttonis tapped
        print("Floating Button Tapped")
    }
}
