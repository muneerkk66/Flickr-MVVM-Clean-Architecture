//
//  APIEnvironment.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

protocol APIEnvironment {
    var environment: AppEnvironment { get }
    func set(to environment: AppEnvironment)
}
