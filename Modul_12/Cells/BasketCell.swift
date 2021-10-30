//
//  BasketCell.swift
//  Modul_12
//
//  Created by Григорий Душин on 26.09.2021.
//

import UIKit

class BasketCell: UITableViewCell {
    
    @IBOutlet weak var imageBasketCell: UIImageView!
    
    @IBOutlet weak var nameBasketCell: UILabel!
    
    @IBOutlet weak var priceBasketCell: UILabel!
    
    @IBOutlet weak var colorBasketCell: UILabel!
    
    @IBOutlet weak var sizeBasketCell: UILabel!
    
    func itemCell(item: RealmBasket) {
        let imageFullUrl = URL(string: "https://blackstarshop.ru/\(item.mainImage)")!
        imageBasketCell.af.setImage(withURL:imageFullUrl)
        colorBasketCell.text = "Цвет: \(item.colorName)"
        nameBasketCell.text = item.name
        sizeBasketCell.text = "Размер: \(item.size)"
        let priseFormated = Int(Double(item.price)!)
        priceBasketCell.text = "\(priseFormated) руб."
    }
    override func prepareForReuse() {
             
        imageBasketCell.image = nil
     }
}
