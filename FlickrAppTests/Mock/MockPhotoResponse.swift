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
        photoID: "1234567890",
        secret: "abcdefg",
        server: "example.server.com",
        farm: 1
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
}
