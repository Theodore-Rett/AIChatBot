//
//  CustomCell.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/10/22.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    
    func configure(i: UIImage) {
        
        imageOutlet.image = i
        
    }
    
    
}
