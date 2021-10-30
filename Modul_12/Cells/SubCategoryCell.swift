//
//  SubCategoryCell.swift
//  Modul_12
//
//  Created by Григорий Душин on 06.09.2021.
//

import UIKit

class SubCategoryCell: UITableViewCell {

    
    @IBOutlet weak var previewImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
             
        previewImageView.image = nil
     }
    
}
