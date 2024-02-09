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
    enum State: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }

    @Published var state: State = .good
    @Published var searchText: String = ""
    @Published var photos = [PhotoItem]()

    @Dependency(\.fetchPhotosUseCase) var fetchPhotosUseCase

    private var disposables = Set<AnyCancellable>()
    private let scheduler: DispatchQueue = .init(label: "Flickr")
    private var page: Int = 0

    init() {
        $searchText
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.state = .good
                self.photos = []
                self.page = 1
                self.fetchPhotos(seachText: text)
            }
            .store(in: &disposables)
    }

    func loadMore() {
        if state != .isLoading {
            fetchPhotos(seachText: searchText)
        }
    }

    func fetchPhotos(seachText: String) {
        guard !seachText.isEmpty else { return }

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
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }

                photos.append(contentsOf: results.photos)
                self.page += 1
                self.state = (results.photos.count >= AppConstants.pageLimit) ? .good : .loadedAll

                saveSearchHistory(text: seachText)
            })
            .store(in: &disposables)
    }

    // TODO: This can be moved to Repository level to maintain the data seperation.

    func saveSearchHistory(text: String) {
        let history = Item(context: PersistenceController.shared.container.viewContext)
        history.searchText = text
        history.timestamp = Date()
        PersistenceController.shared.save()
    }
}
