//
//  ScreenFactory.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

final class ScreenFactory: HomeCoordinatorFactory {

    private let appFactory: AppFactory

    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}

// MARK: - HomeViewFactory
extension ScreenFactory: HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> HomeView {
        let viewModel = HomeViewModel(
            coordinator: coordinator,
            fetchPhotosUseCase: appFactory.makeFetchPhotosUseCase())
        let view = HomeView(viewModel: viewModel)
        return view
    }
}

// MARK: - HistoryViewFactory
extension ScreenFactory: HistoryViewFactory {
    func makeHistoryView() -> HistoryView {
        return HistoryView()
    }
}
