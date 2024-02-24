//
//  HomeViewModel.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Foundation
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var state: PhotosLoadingState = .good
    @Published var searchText: String = ""
    @Published var photos = [PhotoItem]()

    private let coordinator: HomeCoordinatorProtocol
    private let fetchPhotosUseCase: FetchPhotosUseCase

    private var disposables = Set<AnyCancellable>()
    private let scheduler: DispatchQueue = .init(label: "Flickr", qos: .userInitiated)
    private(set) var page: Int = 0

    init(coordinator: HomeCoordinatorProtocol, fetchPhotosUseCase: FetchPhotosUseCase) {
        self.coordinator = coordinator
        self.fetchPhotosUseCase = fetchPhotosUseCase

        listenTextField()
    }

    func listenTextField() {
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
                self.fetchPhotos(searchText: text)
            }
            .store(in: &disposables)
    }

    func handle(_ event: HomeViewEvent) {
        switch event {
        case .loadMorePhotos:
            loadMore()
        case .onTapHistory:
            coordinator.showHistory()
        }
    }

    func loadMore() {
        guard !searchText.isEmpty else {return}
        fetchPhotos(searchText: searchText)
    }

    func fetchPhotos(searchText: String) {
        state = .isLoading
        fetchPhotosUseCase
            .execute(withText: searchText, page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.photos = []
                    self.page = 0
                    self.state = .error(error.message)
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
