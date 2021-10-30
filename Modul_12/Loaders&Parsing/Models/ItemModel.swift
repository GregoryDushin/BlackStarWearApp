//
//  ItemModel.swift
//  Modul_12
//
//  Created by Григорий Душин on 15.09.2021.
//

import Foundation

class ItemData {
    
    var name = ""
    var englishName = ""
    var description = ""
    var mainImage = ""
    var price = ""
    var colorName = ""
    var colorImageURL = ""
    var article = ""
    var offers: NSArray = []
    var productImages: [ProductImages]
    
    init?(data: NSDictionary) {
        
        guard
            let name = data["name"] as? String,
            let englishName = data["englishName"] as? String,
            let description = data["description"] as? String,
            let mainImage = data["mainImage"] as? String,
            let price = data["price"] as? String,
            let colorName = data["colorName"]  as? String,
            let colorImageURL = data["colorImageURL"]  as? String,
            let article = data["article"] as? String,
            let offers = data["offers"] as? NSArray,
            offers.count !=  0,
            let productImages = data["productImages"] as? NSArray
        else { return nil }
        var prodimgs = [ProductImages]()
        
      for data in productImages {
        
        if let img = ProductImages(data: data as! NSDictionary){
            
            prodimgs.append(img)
          }
      }
        
        self.name = name
        self.englishName = englishName
        self.description = description
        self.mainImage = mainImage
        self.price = price
        self.offers = offers
        self.colorImageURL = colorImageURL
        self.colorName = colorName
        self.productImages = prodimgs
        self.article = article
        
    }
    
}
class ProductImages {
    var imageURL = " "
    let sortOrder : Int
    
    init? (data: NSDictionary) {
        guard let imageURL = data["imageURL"] as? String,
              let sortOrder = data["sortOrder"] as? String else { return nil }
        
        self.imageURL = imageURL
        
        self.sortOrder = Int(sortOrder) ?? 0
}
}
