//
//  Routable.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
