//
//  APIClient+Live.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation
import Foundation

final class APIClientLive: APIClient {
    @Dependency(\.apiEnvironment) private var apiEnvironment

    func request<Response>(_ request: APIRequest<Response>) -> AnyPublisher<Response, APIError> {
        do {
            let urlRequest = try request.makeRequest(using: apiEnvironment.environment.baseURL)
            print("Making API request:\n\(urlRequest)")
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .mapError { error in APIError.serverError(error)
                }
                .flatMap(maxPublishers: .max(1)) { pair in
                    decode(pair.data)
                }
                .eraseToAnyPublisher()
        } catch {
            let error = APIError.applicationError
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}