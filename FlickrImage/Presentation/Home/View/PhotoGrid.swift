//
//  PhotoGrid.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

struct PhotoGridView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                .init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3),
                .init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)
            ], spacing: 3) {
                ForEach(viewModel.photos, id: \.id) { photo in
                    PhotoView(url: photo.url)
                }
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .loadedAll:
                    EmptyView()
                case let .error(message):
                    Text(message)
                        .foregroundColor(.pink)
                }
            }
        }
    }
}

#Preview {
    PhotoGridView(viewModel: HomeViewModel())
}
