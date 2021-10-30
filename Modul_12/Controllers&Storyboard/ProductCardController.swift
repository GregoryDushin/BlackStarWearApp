//
//  ProductCardController.swift
//  Modul_12
//
//  Created by Григорий Душин on 19.09.2021.
//

import UIKit

class ProductCardController: UIViewController {
    var productsID: Int!
    var products: [ItemData]!
    var idSubCategories: String!
    var items: [ItemData]!
    var imageArray : [ProductImages] = []
    
    @IBOutlet weak var chooseColorSize: UIButton!
    @IBOutlet weak var ourCollection: UICollectionView!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseColorSize.layer.cornerRadius = 15
        
        
        imageArray = products[productsID].productImages
        
        items =  ourProducts(article: products[productsID].article)
        
        let track = self.products[productsID]
        
        let priseFormated = Int(Double(track.price)!)
        
        ProductName.text = track.name
        ProductPrice.text = "\(priseFormated) руб. "
        ProductDescription.text = track.description
        
        
        
    }
    
    //MARK: func for creating new array for our product with products which have same articles for size/color selections
    
    func ourProducts (article: String) -> [ItemData]{
        let article = article
        var ourProducts: [ItemData] = []
        for index in 0..<products.count{
            if article == products[index].article{
                ourProducts.append(products[index])
            }
        }
        return ourProducts
    }
    
    
    @IBAction func chooseColorSize(_ sender: UIButton) {
        let ColorSizeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ColorSizeVCid") as! ColorSizeViewController
        
        //MARK: similar articles array transfer into color/size selection View
        
        ColorSizeVC.item = self.items
        
        self.addChild(ColorSizeVC)
        ColorSizeVC.view.frame = self.view.frame
        self.view.addSubview(ColorSizeVC.view)
        ColorSizeVC.didMove(toParent: self)
    }
    
    
}

extension ProductCardController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        return imageArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCollectionViewCell
        
        
        let track = self.imageArray[indexPath.row]
        
        
        if let imageFullUrl = URL(string: "https://blackstarshop.ru/\(track.imageURL)") {
            
            cell.myImg.af.setImage(withURL:imageFullUrl)
            
        }else{
            
            cell.myImg.image = #imageLiteral(resourceName: "Empty")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width
        return CGSize(width: w , height: w*2 )
        
        
    }
    
    
}

