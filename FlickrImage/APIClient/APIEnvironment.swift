//
//  APIEnvironment.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Dependencies
import Foundation

protocol APIEnvironment {
    var environment: AppEnvironment { get }
    func set(to environment: AppEnvironment)
}

private struct APIEnvironmentKey: DependencyKey {
    #if PRODUCTION
    static let liveValue: APIEnvironment = APIEnvironmentLive(currentEnvironment: .production)
    #else
    static let liveValue: APIEnvironment = APIEnvironmentLive(currentEnvironment: .development)
    #endif
}

extension DependencyValues {
    var apiEnvironment: APIEnvironment {
        get { self[APIEnvironmentKey.self] }
        set { self[APIEnvironmentKey.self] = newValue }
    }
}
