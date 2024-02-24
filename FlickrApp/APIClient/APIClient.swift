//
//  APIClient.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

protocol APIClient {
    @discardableResult
    func request<Response: Decodable>(_ request: APIRequest<Response>) -> AnyPublisher<Response, APIError>
}
