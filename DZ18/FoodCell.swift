//
//  FoodCell.swift
//  DZ18
//
//  Created by Dmitriy on 10/24/22.
//

import UIKit


class FoodCell: UITableViewCell {
    @IBOutlet weak var nameBubble: UIView!
    @IBOutlet weak var categoryBubble: UIView!
    @IBOutlet weak var priceBubble: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameBubble.layer.cornerRadius = nameBubble.frame.size.height / 5
        categoryBubble.layer.cornerRadius = categoryBubble.frame.size.height / 5
        priceBubble.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        priceBubble.layer.cornerRadius = priceBubble.frame.size.height / 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
