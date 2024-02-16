//
//  HomeViewModel.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    enum LoadingState: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }

    @Published var state: LoadingState = .good
    @Published var searchText: String = ""
    @Published var photos = [PhotoItem]()

    @Dependency(\.fetchPhotosUseCase) var fetchPhotosUseCase

    private var disposables = Set<AnyCancellable>()
    private let scheduler: DispatchQueue = .init(label: "Flickr", qos: .userInitiated)
    private(set) var page: Int = 0

    init() {
        $searchText
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .receive(on: DispatchQueue.main)
            .filter {!$0.isEmpty}
            .sink { [weak self] text in
                guard let self = self else { return }
                self.photos.removeAll()
                self.state = .good
                self.page = 1
                self.fetchPhotos(seachText: text)
            }
            .store(in: &disposables)
    }

    func loadMore() {
        guard !searchText.isEmpty else {return}
        fetchPhotos(seachText: searchText)
    }

    func fetchPhotos(seachText: String) {
        state = .isLoading
        fetchPhotosUseCase
            .execute(withText: seachText, page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.photos = []
                    self.page = 0
                    self.state = .good
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }

                photos.append(contentsOf: results.photos)
                self.page += 1
                self.state = (results.photos.count >= AppConstants.pageLimit) ? .good : .loadedAll

            })
            .store(in: &disposables)
    }
}
