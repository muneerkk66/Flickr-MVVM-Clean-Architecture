//
//  APIError.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

enum APIError: LocalizedError {
    case connectionError
    case serverError(Error)
    case applicationError

    var message: String {
        switch self {
        case .connectionError:
            return "Connection error"
        case .serverError, .applicationError:
            return "Something went wrong"
        }
    }
}

extension Error {
    var applicationError: APIError {
        if let error = self as? URLError {
            return error.code == .notConnectedToInternet
                ? .connectionError
                : .serverError(error)
        } else {
            return .applicationError
        }
    }
}
