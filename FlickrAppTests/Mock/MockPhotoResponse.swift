//
//  MockPhotoResponse.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 09/02/2024.
//

import Foundation
@testable import FlickrApp

struct MockData {
    static let photoMock = Photo(
        photoID: "53534422806",
        secret: "485f97db18",
        server: "65535",
        farm: 66
    )

    static let photosMock = Photos(
        page: 1,
        pages: 1,
        perpage: 1,
        total: 1,
        photo: [photoMock]
    )

    static let photosResponseMock = PhotosResponse(
        photos: photosMock
    )

    static let request = APIRequest<PhotosResponse>(
        path: FlickrServiceLive.Endpoint.fetchPhotos.path,
        query: [AppConstants.PhotosRequestQuery.text: "name",
                AppConstants.PhotosRequestQuery.page: "1",
                AppConstants.PhotosRequestQuery.method: AppConstants.photosRequestMethod,
                AppConstants.PhotosRequestQuery.perPage: String(AppConstants.pageLimit)]
    )

}
