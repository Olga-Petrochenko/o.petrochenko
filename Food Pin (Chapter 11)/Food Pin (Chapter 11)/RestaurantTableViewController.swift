//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 28/10/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    // MARK: - Данные для таблицы
    var restaurantNames = ["Бургер с рыбой", "Гамбургер Джо", "Десерт Маскарпоне", "Жаркое с паровым картофелем", "Каша гречневая", "Каша манная", "Классический кекс", "Креветки на гриле", "Креветки под сыром", "Перцы фаршированные", "Пирожки с картофелем и грибами", "Русский борщ", "Семга на гриле", "Солянка", "Суп с домашней лапшой", "Суп с фрикадельками", "Суп щавелевый", "Сэндвич с ветчиной и сыром", "Сэндвич с тунцом и сыром", "Шоколадный Брауни"]
    
    var restaurantImages = ["Бургер с рыбой", "Гамбургер Джо", "Десерт Маскарпоне", "Жаркое с паровым картофелем", "Каша гречневая", "Каша манная", "Классический кекс", "Креветки на гриле", "Креветки под сыром", "Перцы фаршированные", "Пирожки с картофелем и грибами", "Русский борщ", "Семга на гриле", "Солянка", "Суп с домашней лапшой", "Суп с фрикадельками", "Суп щавелевый", "Сэндвич с ветчиной и сыром", "Сэндвич с тунцом и сыром", "Шоколадный Брауни"]
    
    var restaurantLocations = ["120 Ккал", "340 Ккал", "323 Ккал", "300 Ккал", "150 Ккал", "125 Ккал", "200 Ккал", "201 Ккал", "220 Ккал", "340 Ккал", "250 Ккал", "200 Ккал", "210 Ккал", "120 Ккал", "230 Ккал", "300 Ккал", "75 Ккал", "323 Ккал", "320 Ккал", "200 Ккал"]
    
    var restaurantTypes = ["Фаст Фуд", "Фаст Фуд", "Десерт", "Горячее", "Здоровое питание", "Завтрак", "Десерт", "Закуска", "Закуска", "Горячее", "Пирожки", "Суп", "Горячее", "Суп", "Суп", "Суп", "Суп", "Перекус", "Перекус", "Десерт"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Формирование количества ячеек

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // MARK: -Параметры ячейки
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        //MARK: -Solution to exercise 2
        cell.heartTick.isHidden = !self.restaurantIsVisited[indexPath.row]
        
        return cell
    }
    
    //MARK: -Chapter 11
    // MARK: -Функция "Удалить" при свайпе влево
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
    // Delete the row from the data source
        restaurantNames.remove(at: indexPath.row)
        restaurantLocations.remove(at: indexPath.row)
        restaurantTypes.remove(at: indexPath.row)
        restaurantIsVisited.remove(at: indexPath.row)
        restaurantImages.remove(at: indexPath.row)
    }
        
        //Обновляем массив после удаления элемента (удаляем элемент)
        //at: [indexPath], with: .fade - удаление элементов с анимацией fade
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        print("Total item: \(restaurantNames.count)")
        for name in restaurantNames {
            print(name)
        }
    } */
    
    //Вызов контекстного меню Share при свайпе вправо вместе с кнопкой "Удалить"
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            // Delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
            
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
           
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil) }
          
            // For iPad
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
            } }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true) }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        //Кастомизация кнопок Share и Delete
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0 , blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0 , blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        return swipeConfiguration
    }

    // MARK: -Функция свайп влево: Share и Delete
    //Добавляем возможность вывода меню при клике на карточку рецепта
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // For iPad
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }

        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let checkInTitle = self.restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
            
            // MARK: -Solution to exercise 1
            /* cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark */
            
            // MARK: -Solution to exercise 2
            // We use the isHidden property to control whether the image view is displayed or not
            cell?.heartTick.isHidden = self.restaurantIsVisited[indexPath.row]
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
        })
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        // Deselect a row
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK: -Функция свайп вправо: Check-in / Uncheck
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
            cell.heartTick.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
            completionHandler(true)
        }
        
        let checkInIcon = restaurantIsVisited[indexPath.row] ? "arrow.uturn.left" : "checkmark"
        checkInAction.backgroundColor = UIColor(red: 225.0/255.0, green: 48.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        checkInAction.image = UIImage(systemName: checkInIcon)
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        
        return swipeConfiguration
    }
}
