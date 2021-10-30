
 // Persistance.swift
 // Modul_12

 // Created by Григорий Душин on 28.09.2021.


import Foundation
import RealmSwift
import Realm

//class AllItemsInBasket: Object{
//
//    dynamic var realmBasket = List<RealmBasket>()
//}

class RealmBasket: Object{
    
    @objc dynamic var name: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var colorName: String = ""
    @objc dynamic var mainImage: String = ""
    @objc dynamic var size: String = ""
}
