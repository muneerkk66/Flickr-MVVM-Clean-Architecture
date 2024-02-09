//
//  AppConstants.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

enum AppConstants {
    // The total number of images loaded in each API request.
    static let pageLimit = 50
    static let photosRequestMethod = "flickr.photos.search"

    enum PhotosRequestQuery {
        static let text = "text"
        static let method = "method"
        static let page = "page"
        static let perPage = "per_page"
    }
}
