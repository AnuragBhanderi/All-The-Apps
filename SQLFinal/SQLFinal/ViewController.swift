//
//  ViewController.swift
//  SQLFinal
//
//  Created by Anurag Bhanderi on 05/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var personTable: UITableView!
    
    let cellReuseIdentifier = "cell"
        
    var db:DBHelper = DBHelper()
        
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
                personTable.delegate = self
                personTable.dataSource = self
                
                db.insert(id: 1, name: "Bilal", age: 24)
                db.insert(id: 2, name: "Bosh", age: 25)
                db.insert(id: 3, name: "Thor", age: 23)
                db.insert(id: 4, name: "Edward", age: 44)
                db.insert(id: 5, name: "Ronaldo", age: 34)
                
                persons = db.read()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return persons.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
            cell.textLabel?.text = "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)
            
            return cell
        }


}

