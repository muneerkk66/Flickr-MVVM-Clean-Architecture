//
//  HomeView.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            PhotoGridView(viewModel: viewModel)
                .navigationTitle("Photos")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(value: "Item") {
                            Image(systemName: "clock")
                        }.navigationDestination(for: String.self) { view in
                            if view == "Item" {
                                HistoryView()
                            }
                        }
                    }
                }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    HomeView()
}
