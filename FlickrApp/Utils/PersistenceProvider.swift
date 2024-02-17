//
//  MockPresistence.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 15/02/2024.
//

import Foundation
import CoreData

extension PersistenceController {
    static var preview = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0 ..< 10 {
            let newItem = Item(context: viewContext)
            newItem.updatedAt = Date()
        }

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            LogFatal("Unresolved error (nsError), (nsError.userInfo)")
        }
        return result
    }()
}
