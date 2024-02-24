//
//  PhotosRepository+Live.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

final class PhotosRepositoryLive: PhotosRepository {

    private var flickrService: FlickrService

    init(flickrService: FlickrService) {
        self.flickrService = flickrService
    }

    func fetchPhotos(withText searchText: String, page: Int) -> AnyPublisher<PhotosResult, APIError> {
        guard NetworkMonitor.shared.isConnected else { return Fail(error: APIError.connectionError).eraseToAnyPublisher()}

        return flickrService
            .fetchPhotos(withText: searchText, page: page)

            .map {
                [weak self] result -> PhotosResult in
                // Save History in DB
                self?.saveHistory(withText: searchText)
                return PhotosResult(item: result)

            }.eraseToAnyPublisher()
    }

    func saveHistory(withText searchText: String) {
        let history = Item(context: PersistenceController.shared.container.viewContext)
        history.searchText = searchText
        history.updatedAt = Date()
        PersistenceController.shared.save()
    }
}
