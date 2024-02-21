//
//  HomeCoordinator.swift
//  FlickrApp
//
//  Created by Muneer K K on 21/02/2024.
//

import Foundation
import SwiftUI

public enum AppCoordinator: NavigationRouter {

    case home
    case history

    public var transition: NavigationTransitionStyle {
        switch self {
        case .home:
            return .push
        case .history:
            return .push
        }
    }

    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .home:
            HomeView()
        case .history:
            HistoryView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
