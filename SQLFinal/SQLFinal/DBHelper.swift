//
//  DBHelper.swift
//  sqlite_demo
//
//  Created by Anurag Bhanderi on 05/08/21.
//

import Foundation
import SQLite3

class DBHelper{
    
    var db: OpaquePointer?
    let dbPath: String = "myDb.sqlite"
    
    init()
    {
        db = openDatabase()
        createTable()
    }
    
    
//    Open Database
    func openDatabase() -> OpaquePointer?{
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("Error in Opening database")
            return nil
        }
        
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
//    Create Table
    func createTable(){
        
        let createTableString = "CREATE TABLE IF NOT EXISTS person(Id INTEGER PRIMARY KEY,name TEXT,age INTEGER);"
        var createTabletatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTabletatement, nil) == SQLITE_OK{
            
            if sqlite3_step(createTabletatement) == SQLITE_DONE {
                
                print("Table Created..")
                
            }
            else {
                print("person table could not be created.")
            }
        }
        else{
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTabletatement)
    }
    
    
//    Insert Data
    func insert(id: Int, name: String, age: Int){
        
        let persons = read()
        for p in persons{
            if p.id == id{
                return
            }
        }
        
        let insertStatementString = "INSERT INTO person (Id, name, age) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(age))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            }
            else {
                print("Could not insert row.")
            }
        }
        else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
        
    }
    
    func read() -> [Person] {
        
        let queryStatementstring = "SELECT * FROM person;"
        var queryStatement: OpaquePointer? = nil
        
        var psns: [Person] = []
        
        if sqlite3_prepare_v2(db, queryStatementstring, -1, &queryStatement, nil) == SQLITE_OK{
            
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let year = sqlite3_column_int(queryStatement, 2)
                
                psns.append(Person(id: Int(id), name: name, age: Int(year)))
                print("Query Result:")
                print("\(id) | \(name) | \(year)")
            }
            
        }
        else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func deleteByID(id: Int){
        
        let deleteStatementString = "DELETE FROM person WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                
                print("Successfully deleted row.")
                
            }else {
                print("Could not delete row.")
            }
        }else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
}
