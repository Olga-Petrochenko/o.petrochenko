//
//  RestaurantTableViewController.swift
//  Lesson 6 Food Pin (Chapter 9)
//
//  Created by Petrochenko.O on 26.03.2020.
//  Copyright © 2020 Petrochenko.O. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    // MARK: - Данные для таблицы
    
    var restaurantNames = ["Бургер с рыбой", "Гамбургер Джо", "Десерт Маскарпоне", "Жаркое с паровым картофелем", "Каша гречневая", "Каша манная", "Классический кекс", "Креветки на гриле", "Креветки под сыром", "Перцы фаршированные", "Пирожки с картофелем и грибами", "Русский борщ", "Семга на гриле", "Солянка", "Суп с домашней лапшой", "Суп с фрикадельками", "Суп щавелевый", "Сэндвич с ветчиной и сыром", "Сэндвич с тунцом и сыром", "Шоколадный Брауни"]
    
    var restaurantImages = ["Бургер с рыбой", "Гамбургер Джо", "Десерт Маскарпоне", "Жаркое с паровым картофелем", "Каша гречневая", "Каша манная", "Классический кекс", "Креветки на гриле", "Креветки под сыром", "Перцы фаршированные", "Пирожки с картофелем и грибами", "Русский борщ", "Семга на гриле", "Солянка", "Суп с домашней лапшой", "Суп с фрикадельками", "Суп щавелевый", "Сэндвич с ветчиной и сыром", "Сэндвич с тунцом и сыром", "Шоколадный Брауни"]
    
    var restaurantLocations = ["120 Ккал", "340 Ккал", "323 Ккал", "300 Ккал", "150 Ккал", "125 Ккал", "200 Ккал", "201 Ккал", "220 Ккал", "340 Ккал", "250 Ккал", "200 Ккал", "210 Ккал", "120 Ккал", "230 Ккал", "300 Ккал", "75 Ккал", "323 Ккал", "320 Ккал", "200 Ккал"]
    
    var restauranTypes = ["Фаст Фуд", "Фаст Фуд", "Десерт", "Горячее", "Здоровое питание", "Завтрак", "Десерт", "Закуска", "Закуска", "Горячее", "Пирожки", "Суп", "Горячее", "Суп", "Суп", "Суп", "Суп", "Перекус", "Перекус", "Десерт"]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
    
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restauranTypes[indexPath.row]
        
        return cell }
    
    //Добавляем возможность вывода меню при клике на карточку рецепта
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath
    : IndexPath) {
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .alert)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil) }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)" , style: .default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        //Check-in Action
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark })
        
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        //Deselected the row
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Формирование количества ячеек

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

}
