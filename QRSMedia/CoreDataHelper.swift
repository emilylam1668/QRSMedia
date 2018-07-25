//
//  File.swift
//  MakeSchoolNotes
//
//  Created by Emily Lam on 7/11/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }

        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext

        return context
    }()


    static func newUsername() -> Username {
        let username = NSEntityDescription.insertNewObject(forEntityName: "Username", into: context) as! Username

        return username
    }

    static func saveUsername() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }

    static func delete(username: Username) {
        context.delete(username)

        saveUsername()
    }


    static func retrieveUsernames() -> [Username] {
        do {
            let fetchRequest = NSFetchRequest<Username>(entityName: "Username")
            let results = try context.fetch(fetchRequest)

            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")

            return []
        }
    }
}


