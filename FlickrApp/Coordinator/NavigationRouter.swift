//
//  NavigationRouter.swift
//  FlickrApp
//
//  Created by Muneer K K on 21/02/2024.
//

import Foundation

import SwiftUI

public protocol NavigationRouter {

    associatedtype V: View

    var transition: NavigationTransitionStyle { get }

    @ViewBuilder
    func view() -> V
}
