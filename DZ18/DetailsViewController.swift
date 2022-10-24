//
//  DetailsViewController.swift
//  DZ18
//
//  Created by Dmitriy on 10/24/22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinsLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var factsBubble: UIView!
    @IBOutlet weak var priceBubble: UIView!
    var foodItem: FoodModel?
    var category = ""
    
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch category {
        case "Vegetables":
            self.view.backgroundColor = UIColor.cyan.withAlphaComponent(0.9)
        case "Fruits":
            self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.9)
        case "Drinks":
            self.view.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        default:
            break
        }
        factsBubble.layer.cornerRadius = 20
        priceBubble.layer.cornerRadius = 20
        foodImage.layer.cornerRadius = 20
        priceBubble.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        title = foodItem?.name
        priceLabel.text = "$\(foodItem?.price ?? 0)"
        categoryLabel.text = category
        caloriesLabel.text = "\(foodItem?.calories ?? 0) Kcal."
        proteinsLabel.text = "\(foodItem?.proteins ?? 0) g."
        fatsLabel.text = "\(foodItem?.fats ?? 0) g."
        carbsLabel.text = "\(foodItem?.carbs ?? 0) g."
        switch title {
        case "Spinach":
            foodImage.image = UIImage(named: "spinach")
        case "Banana":
            foodImage.image = UIImage(named: "banana")
        case "Kompot":
            foodImage.image = UIImage(named: "kompot")
        default:
            break
        }
    }
}
