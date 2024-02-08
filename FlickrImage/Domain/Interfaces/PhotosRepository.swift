//
//  PhotosRepository.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation

protocol PhotosRepository {
    @discardableResult
    func fetchPhotos(
        withText seachText: String,
        page: Int
    ) -> AnyPublisher<PhotosResult, APIError>
}

private enum PhotosRepositoryKey: DependencyKey {
    static let liveValue: PhotosRepository = PhotosRepositoryLive()
}

extension DependencyValues {
    var photosRepositoryKey: PhotosRepository {
        get { self[PhotosRepositoryKey.self] }
        set { self[PhotosRepositoryKey.self] = newValue }
    }
}
