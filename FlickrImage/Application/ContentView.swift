//
//  ContentView.swift
//  FlickrImage
//
//  Created by Muneer K K on 08/02/2024.
//

import CoreData
import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
