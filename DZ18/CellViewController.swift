//
//  CellViewController.swift
//  DZ18
//
//  Created by Dmitriy on 10/17/22.
//

import UIKit

class CellViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var sectionedFoodArray = [SectionedFoodModel](repeating: SectionedFoodModel(category: .drinks, foodArray: []), count: 3)
    let foodItem1 = FoodModel(name: "Kompot", price: 3, calories: 93, proteins: 0.2, carbs: 22.3, fats: 0.2, image: nil)
    let foodItem2 = FoodModel(name: "Banana", price: 4, calories: 89, proteins: 1.9, carbs: 22.84, fats: 0.33, image: nil)
    let foodItem3 = FoodModel(name: "Spinach", price: 2.5, calories: 23, proteins: 2.9, carbs: 3.6, fats: 0.4, image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSectionedArray()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodCell", bundle: nil), forCellReuseIdentifier: "FoodCell")
    }
    
    func initSectionedArray() {
        var array = [FoodModel]()
        for _ in 0...5 {
            array.append(foodItem1)
        }
        sectionedFoodArray[0].category = .drinks
        sectionedFoodArray[0].foodArray = array
        array.removeAll()
        
        for _ in 0...5 {
            array.append(foodItem2)
        }
        sectionedFoodArray[1].category = .fruits
        sectionedFoodArray[1].foodArray = array
        array.removeAll()
        
        for _ in 0...5 {
            array.append(foodItem3)
        }
        sectionedFoodArray[2].category = .vegetables
        sectionedFoodArray[2].foodArray = array
    }
}

//MARK: - UITableViewDelegate
extension CellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == "showDetails" {
            if let navVC = segue.destination as? UINavigationController {
                if let destinationVC = navVC.topViewController as? DetailsViewController {
                    destinationVC.foodItem = sectionedFoodArray[indexPath.section].foodArray[indexPath.row]
                    destinationVC.category = sectionedFoodArray[indexPath.section].category.rawValue
                }
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        SectionedFoodModel.Category.allCases.count
    }
}

//MARK: - UITableViewDataSource
extension CellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionedFoodArray[section].foodArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionedFoodArray[section].category.rawValue
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        cell.nameLabel.text = sectionedFoodArray[indexPath.section].foodArray[indexPath.row].name
        cell.priceLabel.text = String(format: "$%.2f", sectionedFoodArray[indexPath.section].foodArray[indexPath.row].price)
        cell.categoryLabel.text = sectionedFoodArray[indexPath.section].category.rawValue
        return cell
    }
}
