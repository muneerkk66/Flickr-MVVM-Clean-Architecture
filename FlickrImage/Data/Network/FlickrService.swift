//
//  FlickrServices.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation
import Combine
import Dependencies
import Foundation

protocol FlickrService {
	func fetchPhotos(
		withText name: String
	) -> AnyPublisher<PhotosResponse, APIError>
}

private enum FlickrServiceKey: DependencyKey {
	static let liveValue: FlickrService = FlickrServiceLive()
}

extension DependencyValues {
	var flickrService: FlickrService {
		get { self[FlickrServiceKey.self] }
		set { self[FlickrServiceKey.self] = newValue }
	}
}
