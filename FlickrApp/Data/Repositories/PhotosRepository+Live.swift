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
            .fetchPhotos(withText: seachText, page: page).map {
                [weak self] result -> PhotosResult in
                // Save History in DB
                self?.saveHistory(withText: seachText)
                return PhotosResult(item: result)

            }.eraseToAnyPublisher()
    }

    func saveHistory(withText seachText: String) {
        let history = Item(context: PersistenceController.shared.container.viewContext)
        history.searchText = seachText
        history.timestamp = Date()
        PersistenceController.shared.save()
    }
}
