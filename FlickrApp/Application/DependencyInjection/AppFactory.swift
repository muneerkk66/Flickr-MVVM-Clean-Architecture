//
//  AppFactory.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

final class AppFactory {
    private lazy var apiClient = APIClientLive(apiEnvironment: APIEnvironmentLive(currentEnvironment: AppEnvironment.development))

    private lazy var flickrService = FlickrServiceLive(apiClient: apiClient)

    private lazy var photosRepository = PhotosRepositoryLive(flickrService: flickrService)

}

// MARK: - Home
extension AppFactory {
    func makeFetchPhotosUseCase() -> FetchPhotosUseCase {
        DefaultFetchPhotosUseCase(photosRepository: photosRepository)
    }
}
