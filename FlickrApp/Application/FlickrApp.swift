//
//  FlickrApp.swift
//  FlickrApp
//
//  Created by Muneer K K on 22/02/2024.
//

import SwiftUI

@main
struct FlickrApp: App {
    private let appFactory = AppFactory()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(screenFactory: ScreenFactory(appFactory: appFactory), coordinator: AppCoordinator()).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .onAppear {
                    NetworkMonitor.shared.startMonitoring()
                }
        }
    }
}
