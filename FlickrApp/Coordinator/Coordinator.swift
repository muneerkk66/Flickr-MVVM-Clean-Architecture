//
//  Coordinator.swift
//  FlickrApp
//
//  Created by Muneer K K on 21/02/2024.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
