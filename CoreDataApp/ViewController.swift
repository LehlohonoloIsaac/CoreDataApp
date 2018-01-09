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
        let _ = CoreDataHandler.saveObject(username: "Kgopotso", password: "djkbj2bhj")
        let someone = CoreDataHandler.saveObject(username: "Someone", password: "njkd3kj")
        var users = CoreDataHandler.fetchObject()
        print("Before delete:")
        for user in users! {
            print("\(String(describing: user.username))'s password is \(String(describing: user.password))")
        }
        
        if CoreDataHandler.deleteObject(user: someone) {
            print("\n After deleting someone:")
            users = CoreDataHandler.fetchObject()
            for user in users! {
                print("\(String(describing: user.username))'s password is \(String(describing: user.password))")
            }
        }
        
        let filteredUsers = CoreDataHandler.filterData()
        print("\n Users with password containg 2")
        for user in filteredUsers {
            print(user.username!)
        }
        
        if CoreDataHandler.cleanDelete() {
            print("\n After deleting every one:")
            users = CoreDataHandler.fetchObject()
            for user in users! {
                print("\(String(describing: user.username))'s password is \(String(describing: user.password))")
            }
        }
   
    }


}

