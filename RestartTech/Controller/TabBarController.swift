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
    let fanMenu = FanMenu()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        fanMenu.frame = CGRect(x: self.tabBar.center.x-125, y: self.view.bounds.height-70, width: 250, height: 250)
//        fanMenu.backgroundColor = .blue
//        fanMenu.center.x = self.view.center.x
    }
    
    func setupMiddleButton() {
        // Create the button
        
        
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
        fanMenu.frame = CGRect(x: 0, y: 0, width: 375, height: 250)
        fanMenu.backgroundColor = .clear
        fanMenu.center = self.view.center
//        self.tabBar.addSubview(fanMenu)
//        self.view.insertSubview(fanMenu, aboveSubview: self.tabBar)
//        middleBtn.addTarget(self, action: #selector(self.menuButtonTapped), for: .touchUpInside)
        
//        fanMenu.translatesAutoresizingMaskIntoConstraints = false
//        fanMenu.backgroundColor = .clear
        
        
//        fanMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
//        fanMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
//        fanMenu.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        fanMenu.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
//        fanMenu.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        fanMenu.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        fanMenu.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        fanMenu.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
//        fanMenu.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        
//        fanMenu.frame.origin = self.view.bounds.origin
        
        
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
