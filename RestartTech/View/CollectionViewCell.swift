//
//  CollectionViewCell.swift
//  RestartTech
//
//  Created by Riad Mohamed on 18/03/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var item: String! {
        didSet {
            imageView.image = UIImage(named: "big_header")
            titleLabel.text = item
            subtitleLabel.text = item
        }
    }
    
}
