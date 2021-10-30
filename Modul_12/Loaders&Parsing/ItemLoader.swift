//
//  ItemLoader.swift
//  Modul_12
//
//  Created by Григорий Душин on 15.09.2021.
//

import Foundation
import Alamofire

class ItemLoader {
    func loadItem(id: String, completion: @escaping ([ItemData]) -> Void){
       
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(id)").responseJSON { response in
            if let objects = response.value,
               let jsonDict = objects as? NSDictionary{
                DispatchQueue.main.async {
                    
                    var products: [ItemData] = []
                    
                    for (_, data) in jsonDict where data is NSDictionary{
                        if let product = ItemData(data: data as! NSDictionary){
                            if !product.name.isEmpty {
                                products.append(product)
                                
                                    
                                
                            }
                        }
                        
                        
                        
                        completion(products)
                    }
                }
                
            }
        }
    }
}
