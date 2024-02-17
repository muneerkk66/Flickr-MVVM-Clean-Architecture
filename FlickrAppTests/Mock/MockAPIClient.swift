//
//  MockAPIClient.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 16/02/2024.
//
import Combine
@testable import FlickrApp
import Foundation
import Network

// Mock class to replace the actual implementation of APIClient
struct MockAPIClient: APIClient {

    func request<Response: Decodable>(_ request: APIRequest<Response>) -> AnyPublisher<Response, APIError> {
        return  Just(MockData.photosResponseMock as! Response)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
}

struct MockAPIEnvironment: APIEnvironment {
    var environment: FlickrApp.AppEnvironment
    func set(to environment: FlickrApp.AppEnvironment) {
    }
}

extension MockAPIEnvironment {
    static func success() -> MockAPIEnvironment {
        MockAPIEnvironment(environment: AppEnvironment.development)
    }

    static func failure() -> MockAPIEnvironment {
        MockAPIEnvironment(environment: AppEnvironment.test)
    }
}
