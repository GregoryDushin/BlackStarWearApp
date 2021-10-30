import Foundation
import Alamofire

class CategoriesLoader{

    func loadCategories(completition: @escaping ([WelcomeValue]) -> Void){

       AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON
       { response in
                if let objects = response.value ,
                let  jsonDict = objects as? NSDictionary{

                   var categories: [WelcomeValue] = []
    
                    for (_, data) in jsonDict where data is NSDictionary{
                        
                        if let category = WelcomeValue(data: data as! NSDictionary)

                  {categories.append(category)
                            
                            for (index,_) in categories.enumerated(){
                                if categories[index].name == "Коллекции"{
                                    categories.remove(at: index)
                                }
                            }
                            for (index,_) in categories.enumerated(){
                                if categories[index].name == "Пуховики"{
                                    categories.remove(at: index)
                                }
                            }
                            for (index,_) in categories.enumerated(){
                                if categories[index].name == "Marketplace"{
                                    categories.remove(at: index)
                                }
                            }
                categories = categories.sorted { $0.sortOrder < $1.sortOrder }
                           
                        }}
                    
                        DispatchQueue.main.async {
                        }
                        completition(categories)
                        }
             }}
    
}
