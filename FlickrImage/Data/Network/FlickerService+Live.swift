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
	@Dependency(\.apiEnvironment) private var apiEnvirorment

	private enum Endpoint {
		case fetchPhotos
		var path: String {
			switch self {
			case .fetchPhotos:
				return "/services/rest/?method=flickr.photos.search&format=json"
			}
		}
	}
}

extension FlickrServiceLive: FlickrService {
	func fetchPhotos(
		withText name: String
	) -> AnyPublisher<PhotosResponse, APIError> {
		let parms = [PhotosRequestQuery.text: name]
		let fetchPhotosRequest = APIRequest<PhotosResponse>(
			path: Self.Endpoint.fetchPhotos.path,
			query: parms
		)
		return apiClient.request(fetchPhotosRequest)
	}
}

