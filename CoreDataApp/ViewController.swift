//
//  ViewController.swift
//  CoreDataApp
//
//  Created by dvt on 2018/01/09.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = CoreDataHandler.saveObject(username: "Hloni", password: "sjndjkk")
        let _ = CoreDataHandler.saveObject(username: "Niza", password: "jknksjbkjd")
        let _ = CoreDataHandler.saveObject(username: "Kgopotso", password: "djkbjkbhj")
        
        let users = CoreDataHandler.fetchObject()
        for user in users! {
            print("\(String(describing: user.username))'s password is \(String(describing: user.password))")
        }
        
    }
}

