//
//  FlickerService+Live.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation

final class FlickrServiceLive {
    @Dependency(\.apiClient) private var apiClient

    enum Endpoint {
        case fetchPhotos
        var path: String {
            switch self {
            case .fetchPhotos:
                return "/services/rest/"
            }
        }
    }
}

extension FlickrServiceLive: FlickrService {
    func fetchPhotos(
        withText name: String, page: Int
    ) -> AnyPublisher<PhotosResponse, APIError> {
        let parms = [
            AppConstants.PhotosRequestQuery.text: name,
            AppConstants.PhotosRequestQuery.page: String(page),
            AppConstants.PhotosRequestQuery.method: AppConstants.photosRequestMethod,
            AppConstants.PhotosRequestQuery.perPage: String(AppConstants.pageLimit)
        ]

        let fetchPhotosRequest = APIRequest<PhotosResponse>(
            path: Self.Endpoint.fetchPhotos.path,
            query: parms
        )
        return apiClient.request(fetchPhotosRequest)
    }
}
