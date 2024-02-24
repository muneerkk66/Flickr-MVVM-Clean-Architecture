//
//  HomeCoordinator.swift
//  FlickrApp
//
//  Created by Muneer K K on 22/02/2024.
//

import Foundation

import Combine

final class HomeCoordinator: Coordinator {

    enum Screen: Routable {
        case history
    }
    @Published var navigationPath = [Screen]()

}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showHistory() {
        navigationPath.append(.history)
    }
}
