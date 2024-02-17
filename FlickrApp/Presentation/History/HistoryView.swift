//
//  HistoryView.swift
//  FlickrImage
//
//  Created by Muneer K K on 09/02/2024.
//

import CoreData
import SwiftUI

struct HistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.updatedAt, ascending: false)],
        animation: .default
    )
    private var items: FetchedResults<Item>

    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading) {
                    Text(item.searchText ?? "").font(.title3)
                    Text("\(item.updatedAt ?? Date(), formatter: dateFormatter)").font(.callout)
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
