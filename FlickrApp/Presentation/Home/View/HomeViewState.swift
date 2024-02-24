//
//  HomeViewState.swift
//  FlickrApp
//
//  Created by Muneer K K on 23/02/2024.
//

import Foundation

enum HomeViewEvent {
    case onTapHistory
    case loadMorePhotos
}

enum PhotosLoadingState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
