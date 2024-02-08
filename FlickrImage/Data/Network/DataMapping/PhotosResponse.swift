//
//  FlickrAPIResponse.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Foundation
struct PhotosResponse: Decodable {
	let stat: String?
	let photos: Photos?
}

struct Photos: Decodable {
	let page: Int
	let pages: Int
	let perpage: Int
	let total: String?
	var photo: [Photo] = []
}

struct Photo: Decodable {
	let photoID: String
	let owner: String?
	let secret: String
	let server: String
	let farm: Int
	let title: String?
	let ispublic: Int?
	let isfriend: Int?
	let isfamily: Int?
}
extension Photo {
	private enum CodingKeys: String, CodingKey {
		case photoID = "id"
		case owner
		case secret
		case server
		case farm
		case title
		case ispublic
		case isfriend
		case isfamily

	}
}
