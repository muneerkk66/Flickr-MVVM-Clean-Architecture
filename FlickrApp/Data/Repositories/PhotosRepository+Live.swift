//
//  PhotosRepository+Live.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation

final class PhotosRepositoryLive: PhotosRepository {
    @Dependency(\.flickrService) var flickrService

    func fetchPhotos(withText seachText: String, page: Int) -> AnyPublisher<PhotosResult, APIError> {
        flickrService
            .fetchPhotos(withText: seachText, page: page).map(PhotosResult.init).eraseToAnyPublisher()
    }
}
