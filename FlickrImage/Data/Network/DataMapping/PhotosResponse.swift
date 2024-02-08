//
//  PhotosResponse.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation

struct PhotosResponse: Decodable {
    var photos: Photos?
}

struct Photos: Decodable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    var photo: [Photo] = []
}

struct Photo: Decodable {
    let photoID: String
    let secret: String
    let server: String
    let farm: Int
    let title: String?
}

extension Photo {
    private enum CodingKeys: String, CodingKey {
        case photoID = "id"
        case secret
        case server
        case farm
        case title
    }
}
