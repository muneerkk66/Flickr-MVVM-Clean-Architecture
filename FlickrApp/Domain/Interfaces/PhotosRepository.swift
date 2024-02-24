//
//  PhotosRepository.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

protocol PhotosRepository {
    @discardableResult
    func fetchPhotos(
        withText searchText: String,
        page: Int
    ) -> AnyPublisher<PhotosResult, APIError>

    func saveHistory(
        withText searchText: String
    )
}
