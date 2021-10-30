

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
             
        previewImageView.image = nil
     }
    
}
