//
//  SectionHeaderView.swift
//  RestartTech
//
//  Created by Riad Mohamed on 18/03/2021.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var homeSection: MySection! {
        didSet {
            sectionTitleLabel.text = homeSection.name
            imageView.image = UIImage(named: homeSection.imageName)
        }
    }
}

