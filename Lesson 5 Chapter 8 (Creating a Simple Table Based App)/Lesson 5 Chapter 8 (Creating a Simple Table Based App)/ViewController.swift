//
//  ViewController.swift
//  Lesson 5 Chapter 8 (Creating a Simple Table Based App)
//
//  Created by Petrochenko.O on 12.03.2020.
//  Copyright © 2020 Petrochenko.O. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl" , "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Ba kery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl" , "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //Подгрузка текста для ячеек из массива restaurantNames
        cell.textLabel?.text = restaurantNames[indexPath.row]
        
        //Подгрузка изображений из массива restaurantImages
        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        //Вернуть данные ячейки
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
