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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}
