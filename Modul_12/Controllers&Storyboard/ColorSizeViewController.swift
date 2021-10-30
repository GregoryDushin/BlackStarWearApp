//
//  ColorSizeViewController.swift
//  Modul_12
//
//  Created by Григорий Душин on 26.09.2021.
//

import UIKit
import Realm
import RealmSwift

class ColorSizeViewController: UIViewController {
    
    @IBOutlet weak var putInBasket: UIButton!
    @IBOutlet weak var colorTable: UITableView!
    @IBOutlet weak var sizeTable: UITableView!
    @IBOutlet var viewInvisible: UIView!
    
    
    private let realm = try! Realm()
    
    var item : [ItemData] = []
    var indexColor = 0
    var indexSize = 0
    var colorSelect = ""
    var rowCount = 0
    var sizeDictionary: NSArray = []
    var arraySelectedColorItem: NSDictionary = [:]
    var selectedSize = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        putInBasket.layer.cornerRadius = 15
        
        viewInvisible.backgroundColor = .clear
        
        
    }
    
    @IBAction func putInBasket(_ sender: UIButton) {
        
        if colorSelect == "" || selectedSize == "" {
            let alert = UIAlertController(title: .none, message: "Пожалуйста, выберите цвет и размер", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            realm.beginWrite()
            
            let newItem = RealmBasket()
            
            newItem.colorName = colorSelect
            newItem.size = selectedSize
            newItem.mainImage = item[indexColor].mainImage
            newItem.name = item[indexColor].name
            newItem.price = item[indexColor].price
            
            realm.add(newItem)
            
            try! realm.commitWrite()
            
            self.view.removeFromSuperview()
            
            let alert = UIAlertController(title: .none, message: "Товар добавлен в вашу корзину.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
extension ColorSizeViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.colorTable) {
            self.rowCount =  item.count
        }
        if (tableView == self.sizeTable) {
            if indexColor == 0 {
                
                self.rowCount = item[0].offers.count
            }
        }
        return self.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.colorTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as! ColorCell
            
            cell.colorLabel.text = item[indexPath.row].colorName
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell", for: indexPath) as! SizeCell
            
            if indexColor == 0 {
                
                let labelArray = item[0].offers[indexPath.row] as! NSDictionary
                
                let labelText = labelArray["size"] as! String
                
                cell.sizeLabel.text = labelText
            } else {
                
                indexSize = indexPath.row
                
                let labelArray = sizeDictionary[indexPath.row] as! NSDictionary
                
                let labelText = labelArray["size"] as! String
                
                cell.sizeLabel.text = labelText
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == self.colorTable) {
            self.indexColor = indexPath.row
            self.colorSelect = item[indexColor].colorName
            self.rowCount =  item[indexColor].offers.count
            self.sizeDictionary = item[indexColor].offers
            self.sizeTable.reloadData()
        }
        
        
        if (tableView == self.sizeTable) {
            
            if self.sizeDictionary == [ ] {
                
                let alert = UIAlertController(title: "SORRY ", message: "First select the color.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                self.arraySelectedColorItem = sizeDictionary[indexSize] as! NSDictionary
                
                self.selectedSize = arraySelectedColorItem["size"] as! String
            }
        }
    }
}
