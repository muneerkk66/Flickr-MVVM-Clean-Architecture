//
//  Coordinator.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
