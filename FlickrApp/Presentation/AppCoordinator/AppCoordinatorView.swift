//
//  AppCoordinatorView.swift
//  FlickrApp
//
//  Created by Muneer K K on 22/02/2024.
//
import SwiftUI
struct AppCoordinatorView: View {

    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: AppCoordinator

    init(screenFactory: ScreenFactory, coordinator: AppCoordinator) {
        self.screenFactory = screenFactory
        self.coordinator = coordinator
    }

    var body: some View {
        sceneView
            .onAppear {
                coordinator.handle(.showMain)
            }
    }

    @ViewBuilder
    private var sceneView: some View {
        switch coordinator.state {
        case .idle:
            EmptyView()

        case .main:
            HomeCoordinatorView(HomeCoordinator(), factory: screenFactory)
        }
    }
}
