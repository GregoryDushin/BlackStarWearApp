//
//  ItemCollectionViewCell.swift
//  Modul_12
//
//  Created by Григорий Душин on 07.10.2021.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImg: UIImageView!
    
    override func prepareForReuse() {
             
       myImg.image = nil
     }
}
