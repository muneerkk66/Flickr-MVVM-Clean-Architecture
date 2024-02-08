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
                        Button(action: {
                            // Handle action when the right button is tapped
                        }) {
                            Image(systemName: "clock")
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
