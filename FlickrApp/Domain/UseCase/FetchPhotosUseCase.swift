//
//  FetchPhotosUseCase.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

protocol FetchPhotosUseCase {
    func execute(
        withText name: String,
        page: Int
    ) -> AnyPublisher<PhotosResult, APIError>
}

final class DefaultFetchPhotosUseCase: FetchPhotosUseCase {
    private var photosRepository: PhotosRepository

    init(photosRepository: PhotosRepository) {
        self.photosRepository = photosRepository
    }

    func execute(withText name: String, page: Int) -> AnyPublisher<PhotosResult, APIError> {
        return photosRepository.fetchPhotos(withText: name, page: page)
    }
}
