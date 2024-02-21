//
//  HomeView.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var coordinator: Coordinator<AppCoordinator>

    var body: some View {
        PhotoGridView(viewModel: viewModel)
            .navigationTitle("Photos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        coordinator.show(.history)
                    } label: {
                        Image(systemName: "clock")
                    }

                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    HomeView()
}
