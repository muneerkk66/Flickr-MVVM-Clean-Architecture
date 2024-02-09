//
//  FlickrImageApp.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

@main
struct FlickrImageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
