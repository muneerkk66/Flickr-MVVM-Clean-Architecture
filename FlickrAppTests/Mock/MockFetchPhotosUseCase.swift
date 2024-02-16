//
//  MockPhotsUseCase.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 16/02/2024.
//

import Combine
import Dependencies
@testable import FlickrApp
import XCTest

// Mock FetchPhotosUseCase for testing
class MockFetchPhotosUseCase: FetchPhotosUseCase {
    let result: Result<PhotosResult, APIError>

    init(result: Result<PhotosResult, APIError>) {
        self.result = result
    }

    func execute(withText searchText: String, page: Int) -> AnyPublisher<PhotosResult, APIError> {
        return result.publisher.eraseToAnyPublisher()
    }
}

extension MockFetchPhotosUseCase {
    static func success(with item: PhotosResponse) -> MockFetchPhotosUseCase {
        let photosResult = PhotosResult(item: item)
        return MockFetchPhotosUseCase(result: .success(photosResult))
    }

    static func failure(error: APIError) -> MockFetchPhotosUseCase {
        return MockFetchPhotosUseCase(result: .failure(error))
    }
}
