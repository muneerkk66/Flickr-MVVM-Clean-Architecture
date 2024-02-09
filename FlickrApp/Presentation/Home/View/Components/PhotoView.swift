//
//  PhotoView.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import SwiftUI

struct PhotoView: View {
    let url: URL?
    var body: some View {
        Group {
            if let url = url {
                AsyncImage(url: url)
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
            } else {
                Text("No Image")
            }
        }
    }
}

#Preview {
    PhotoView(url: URL(string: ""))
}
