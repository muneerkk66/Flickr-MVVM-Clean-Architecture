//
//  ScreenFactoryProtocol.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

@MainActor
protocol HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> HomeView
}

@MainActor
protocol HistoryViewFactory {
    func makeHistoryView() -> HistoryView
}
