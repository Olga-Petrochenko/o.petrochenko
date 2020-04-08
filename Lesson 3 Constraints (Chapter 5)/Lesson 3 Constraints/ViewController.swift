//
//  ViewController.swift
//  Lesson 3 Constraints
//
//  Created by Petrochenko.O on 04.03.2020.
//  Copyright © 2020 Petrochenko.O. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(title: "Welcome to My First App!", message: nil, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }

}

