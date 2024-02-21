//
//  SceneDelegate.swift
//  FlickrApp
//
//  Created by Muneer K K on 21/02/2024.
//

import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {

    private let coordinator: Coordinator<AppCoordinator> = .init(startingRoute: .home)

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}
