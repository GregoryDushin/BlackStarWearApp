//
//  SubViewController.swift
//  Modul_12
//
//  Created by Григорий Душин on 06.09.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class SubViewController: UIViewController {
    
    var subCategories: [Subcategory] = []
    
    let imageUrlString =  "https://blackstarshop.ru/"
    
    @IBOutlet weak var SubTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
extension SubViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath) as! SubCategoryCell
        
        let cat = self.subCategories[indexPath.row]
        
        cell.nameLabel.text = cat.name
        
        if let imageFullUrl = URL(string: "\(imageUrlString)\(cat.iconImage)") {
        
        cell.previewImageView.image = #imageLiteral(resourceName: "Empty")
        
        cell.previewImageView.af.setImage(withURL:imageFullUrl)
        
        } else {
            
            cell.previewImageView.image = #imageLiteral(resourceName: "Empty")
           
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCategories.count
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tableViewCell = sender as! UITableViewCell
        
        let indexPath = SubTableView.indexPath(for: tableViewCell)!
        
        if segue.identifier == "Products" {
            
            let PCVC = segue.destination as! ProductListViewController
            
            PCVC.idSubCategories = subCategories[indexPath.row].id
            
            PCVC.productsNavigationItem.title = subCategories[indexPath.row].name
        }
    }
    
}

