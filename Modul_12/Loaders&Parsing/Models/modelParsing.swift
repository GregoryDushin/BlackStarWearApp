//
//  modelParsing.swift
//  Modul_12
//
//  Created by Григорий Душин on 26.08.2021.
//

import Foundation

//MARK: - MY ALAMOFIRE MODEL

class WelcomeValue{
    let name: String
    let sortOrder: Int
    let image: String
    var subcategories: [Subcategory]
    init?(data: NSDictionary){
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let image = data["image"] as? String,
              let subcategories = data["subcategories"] as? [NSDictionary] else { return nil }
        var subcat = [Subcategory]()
        for data in subcategories {
            if let sub = Subcategory(data: data){
                subcat.append(sub)
            }
        }
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.image = image
        self.subcategories = subcat
    }
}

class Subcategory {
    let id: String
    let iconImage: String
    let sortOrder: Int
    let name: String
    
    init?(data: NSDictionary) {
        guard let id = data["id"] as? String,
              let iconImage = data["iconImage"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let name = data["name"] as? String else { return nil }
        self.id = id
        self.iconImage = iconImage
        self.sortOrder = Int(sortOrder) ?? 0
        self.name = name
        
    }
}
