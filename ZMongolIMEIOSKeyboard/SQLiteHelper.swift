//
//  SQLiteHelper.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 12.04.2021.
//

import Foundation
import SQLite
import SQLite3

class SQLiteHelper {
    var db: OpaquePointer!
    
    init() {
        let bundlePath = Bundle.main.path(forResource: "z52words03", ofType: ".db")
        let destPath = NSSearchPathForDirectoriesInDomains(.allLibrariesDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let fullDestPath = URL(fileURLWithPath: destPath).appendingPathComponent("mongolianSuggestion.db")
        if fileManager.fileExists(atPath: fullDestPath.path){
            print("Database file is exist")
            print(fileManager.fileExists(atPath: bundlePath!))
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPath.path)
            }catch{
                print("\n",error)
            }
        }
        db = openDatabase()
    }
    
    private func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default
            .url(for: .allLibrariesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("mongolianSuggestion.db")
        
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return nil
        } else {
            print("Successfully opened connection to database at \("mongolianSuggestion.db")")
            return db
        }
    }
    
    public func read(dbTable: String, latin: String) -> [Suggestion] {
        let queryStatementString = """
            SELECT *
            FROM \(dbTable)
            WHERE latin LIKE '\(latin)%'
            ORDER BY wlen ASC
            LIMIT 30;
            """
        var queryStatement: OpaquePointer? = nil
        var suggestions : [Suggestion] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let mongolWord = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let engWord = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                suggestions.append(Suggestion(mongolWord: mongolWord, engWord: engWord))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return suggestions
    }
}

struct Suggestion {
    var mongolWord: String
    var engWord: String
}
