//
//  FlickrService.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation

protocol FlickrService {
    func fetchPhotos(
        withText name: String,
        page: Int
    ) -> AnyPublisher<PhotosResponse, APIError>
}
