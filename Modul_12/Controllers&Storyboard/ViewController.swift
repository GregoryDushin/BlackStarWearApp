
import UIKit
import AlamofireImage
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var categoriesBSW: [WelcomeValue] = []
    
    let imageUrlString =  "https://blackstarshop.ru/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoriesLoader().loadCategories { (categoriesBSW) in
            self.categoriesBSW = categoriesBSW
            self.tableView.reloadData()
        }
        
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesBSW.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        
        let cat = categoriesBSW[indexPath.row]
        
        cell.nameLabel.text = cat.name
        
        if let imageFullUrl = URL(string: "\(imageUrlString)\(cat.image)") {
        
        cell.previewImageView.image = #imageLiteral(resourceName: "Empty")
        
        cell.previewImageView.af.setImage(withURL:imageFullUrl)
            
        } else {
            
        cell.previewImageView.image = #imageLiteral(resourceName: "Empty")
            
        }
        return cell
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewCell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: tableViewCell)!
        
        if segue.identifier == "SubCategories" {
            let SCTVC = segue.destination as! SubViewController
            
            SCTVC.subCategories = categoriesBSW[indexPath.row].subcategories
            
        }
    }
    
}

