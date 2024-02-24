//
//  HomeView.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        PhotoGridView(viewModel: viewModel)
            .navigationTitle("Photos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.handle(.onTapHistory)
                    } label: {
                        Image(systemName: "clock")
                    }

                }
            }
            .searchable(text: $viewModel.searchText)

    }

}

#Preview {
    HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator(), fetchPhotosUseCase: AppFactory().makeFetchPhotosUseCase()))
}
