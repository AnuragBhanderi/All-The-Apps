//
//  Person.swift
//  sqlite_demo
//
//  Created by Anurag Bhanderi on 05/08/21.
//

import Foundation
import SQLite3

class Person{
    
    var id: Int = 0
    var name: String = ""
    var age: Int = 0
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}


