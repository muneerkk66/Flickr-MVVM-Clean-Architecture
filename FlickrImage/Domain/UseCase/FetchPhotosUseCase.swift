//
//  FetchPhotosUseCase.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation

protocol FetchPhotosUseCase {
    func execute(
        withText name: String,
        page: Int
    ) -> AnyPublisher<PhotosResult, APIError>
}

final class DefaultFetchPhotosUseCase: FetchPhotosUseCase {
    @Dependency(\.photosRepositoryKey) private var photosRepository

    func execute(withText name: String, page: Int) -> AnyPublisher<PhotosResult, APIError> {
        return photosRepository.fetchPhotos(withText: name, page: page)
    }
}

private enum FetchPhotosUseCaseKey: DependencyKey {
    static let liveValue: FetchPhotosUseCase = DefaultFetchPhotosUseCase()
}

extension DependencyValues {
    var fetchPhotosUseCase: FetchPhotosUseCase {
        get { self[FetchPhotosUseCaseKey.self] }
        set { self[FetchPhotosUseCaseKey.self] = newValue }
    }
}
