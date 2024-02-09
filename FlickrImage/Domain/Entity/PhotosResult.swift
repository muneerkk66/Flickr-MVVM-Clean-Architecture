//
//  PhotosResult.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

struct PhotosResult {
    private let item: PhotosResponse

    init(item: PhotosResponse) {
        self.item = item
    }
    var photos: [PhotoItem] {
        item.photos?.photo.map { PhotoItem(item: $0) } ?? []
    }
}

struct PhotoItem: Identifiable {
    private let item: Photo
    var id: String {
        item.photoID
    }

    init(item: Photo) {
        self.item = item
    }

    // MARK: With this approach, you get the benefits of URL encoding and escaping provided by URLComponents.
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "farm\(item.farm).static.flickr.com"
        components.path = "/\(item.server)/\(item.photoID)_\(item.secret).jpg"
        return components.url
    }
}
