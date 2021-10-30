//
//  CollectionViewCell.swift
//  Modul_12
//
//  Created by Григорий Душин on 15.09.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var oldPriceLabel: UILabel!
    
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    @IBOutlet weak var collectionName: UILabel!
    
    @IBOutlet weak var collectionPrice: UILabel!
   
    override func prepareForReuse() {
             
       collectionImage.image = nil
     }
}
