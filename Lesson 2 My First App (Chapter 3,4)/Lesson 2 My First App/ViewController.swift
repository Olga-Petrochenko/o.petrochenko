//
//  ViewController.swift
//  Lesson 2 My First App
//
//  Created by Petrochenko.O on 04.03.2020.
//  Copyright © 2020 Petrochenko.O. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
    }
    
    /*func buttonsParametrs(obj: UIButton) {
        
        obj.layer.cornerRadius = 10
        obj.clipsToBounds = true
        
    }*/
    
    //Создаём алерт с сообщением, возникающий при нажатии на кнопку
    @IBAction func showMessage(sender: UIButton) {
        var emojiDictionary: [String: String] = ["👍": "One",
                                                 "🤝": "Two",
                                                 "🤛": "Three",
                                                 "🤘": "Four",
                                                 "🖖": "Five"]
        //sender - кнопка, которую нажимает пользователь
        //В неё передаём значение лэйбла на кнопке
        let selectedButton = sender
        
        if let wordToLookUp = selectedButton.titleLabel?.text {
            var meaning = emojiDictionary[wordToLookUp]
            
            /*for i in 0...emojiDictionary.count - 1 {
                var key[i]: String = emojiDictionary[i]
            }
            
            for i in 0...emojiDictionary.count - 1 {
                if meaning != emojiDictionary[i] {
                    meaning = "Sorry"
                } else {
                    meaning = emojiDictionary[wordToLookUp]
                }
            }*/

            let alertController = UIAlertController(title: "Meaning: ", message: meaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}
