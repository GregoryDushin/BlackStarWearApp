//
//  ProductListViewController.swift
//  Modul_12
//
//  Created by Григорий Душин on 16.09.2021.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productsNavigationItem: UINavigationItem!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    
    var idSubCategories: String!
    
    var products : [ItemData] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ItemLoader().loadItem(id: idSubCategories) { products in
            self.products = products
            self.itemCollectionView.reloadData()
        }
        
    }
}

// MARK: DataSource

extension ProductListViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let track = self.products[indexPath.row]
        
        let priseFormated = Int(Double(track.price)!)
        
        cell.collectionName.text = track.name
        
        cell.collectionPrice.text = "\(priseFormated) руб. "
        
        if let imageFullUrl = URL(string: "https://blackstarshop.ru/\(track.mainImage)") {
            cell.collectionImage.af.setImage(withURL:imageFullUrl)
            
        }else{
            
            cell.collectionImage.image = #imageLiteral(resourceName: "Empty")
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width/2
        return CGSize(width: w, height: w*2 )
        
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let collectionViewCell = sender as! UICollectionViewCell
        
        let indexPath = itemCollectionView.indexPath(for: collectionViewCell)!
        
        if segue.identifier == "Product" {
            
            let PCVC = segue.destination as! ProductCardController
            
            PCVC.productsID = indexPath.row
            PCVC.products = products
            PCVC.idSubCategories = idSubCategories
            
        }
    }
   
    }
    



