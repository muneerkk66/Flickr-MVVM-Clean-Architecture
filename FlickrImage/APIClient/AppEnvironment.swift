//
//  AppEnvironment.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

enum AppEnvironment: String, Codable, CaseIterable {
    case development = "dev"
    case qa
    case production = "prod"
}

// TODO: Update environemnt variables based on the server.
extension AppEnvironment {
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://api.flickr.com")!
        case .qa:
            return URL(string: "https://api.flickr.com")!
        case .production:
            return URL(string: "https://api.flickr.com")!
        }
    }

    // TODO: Store your keys and secrets away from your source code ,use Arkana keys : https://github.com/rogerluan/arkana
    var apiKey: String {
        switch self {
        case .development:
            return "441d46abf1eb6066ecf67cdd8a753f29"
        case .qa:
            return "441d46abf1eb6066ecf67cdd8a753f29"
        case .production:
            return "441d46abf1eb6066ecf67cdd8a753f29"
        }
    }
}
