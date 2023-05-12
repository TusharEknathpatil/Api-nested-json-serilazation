//
//  TableViewCellProduct.swift
//  JSon-Serilazation-Nested
//
//  Created by Mac on 12/05/23.
//

import UIKit

class TableViewCellProduct: UITableViewCell {

    @IBOutlet weak var imageViewLbl: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
