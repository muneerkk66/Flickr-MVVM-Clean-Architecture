//
//  Parser.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { _ in
            APIError.applicationError
        }
        .eraseToAnyPublisher()
}
