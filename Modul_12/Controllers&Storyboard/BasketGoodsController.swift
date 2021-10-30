//
//  BasketGoodsController.swift
//  Modul_12
//
//  Created by Григорий Душин on 26.09.2021.
//

import UIKit
import RealmSwift
import Realm

class BasketGoodsController: UIViewController {
    @IBOutlet weak var orderAction: UIButton!
    
    @IBOutlet weak var tabBarBasket: UITabBarItem!
    @IBOutlet weak var shoppingTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    private let realm = try! Realm()
    
    private var data = [RealmBasket]()
    
    
    override func  viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        updArray()
        totalPriceCount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderAction.layer.cornerRadius = 15
        updArray()
        totalPriceCount()
        data = realm.objects(RealmBasket.self).map({$0})
        
    }
    
    
    @IBAction func orderAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Хорошая попытка!", message:.none , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension BasketGoodsController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! BasketCell
        
        cell.itemCell(item: data[indexPath.row])
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            
            realm.beginWrite()
            
            realm.delete(data[indexPath.row])
            
            try! realm.commitWrite()
            
            self.updArray()
            
            self.totalPriceCount()
            
        }
    }
    
    
    
    func updArray(){
        data = realm.objects(RealmBasket.self).map({$0})
        self.shoppingTableView.reloadData()
    }
    
    func totalPriceCount(){
        var priseFormated = 0
        for index in 0..<data.count {
            if let data = (Double(data[index].price))
            {
                let a = Int(data)
                priseFormated += a
            }
        }
        self.totalPriceLabel.text = "\(priseFormated) руб."
        self.totalPriceLabel.reloadInputViews()
        
    }
    
    
}
