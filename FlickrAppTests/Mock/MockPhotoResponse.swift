//
//  MockPhotoResponse.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 09/02/2024.
//

import Foundation
@testable import FlickrApp

struct MockData {
    static let photo = Photo(
        photoID: "53534422806",
        secret: "485f97db18",
        server: "65535",
        farm: 66
    )

    static let photos = Photos(
        page: 1,
        pages: 1,
        perpage: 1,
        total: 1,
        photo: [photo]
    )

    static let photosResponse = PhotosResponse(
        photos: photos
    )

    static let request = APIRequest<PhotosResponse>(
        path: FlickrServiceLive.Endpoint.fetchPhotos.path,
        query: [AppConstants.PhotosRequestQuery.text: "name",
                AppConstants.PhotosRequestQuery.page: "1",
                AppConstants.PhotosRequestQuery.method: AppConstants.photosRequestMethod,
                AppConstants.PhotosRequestQuery.perPage: String(AppConstants.pageLimit)]
    )

    static let imageUrl = "https://picsum.photos/400/300"

}
