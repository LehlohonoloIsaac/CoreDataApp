//
//  Persistable.swift
//  CoreDataApp
//
//  Created by dvt on 2018/01/09.
//  Copyright © 2018 dvt. All rights reserved.
//

import Foundation

protocol Persistable {
    func create() -> Bool
    func fetch() -> Bool
    func update()
    func delete()
}
