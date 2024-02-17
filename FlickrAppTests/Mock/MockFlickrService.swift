//
//  MockFlickrService.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 17/02/2024.
//

import Foundation
import Combine
@testable import FlickrApp
import Network
// Mock class to replace the actual implementation of FlickrService
struct MockFlickrService: FlickrService {
    func fetchPhotos(withText name: String, page: Int) -> AnyPublisher<PhotosResponse, APIError> {
        return  Just(MockData.photosResponseMock)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }

}
