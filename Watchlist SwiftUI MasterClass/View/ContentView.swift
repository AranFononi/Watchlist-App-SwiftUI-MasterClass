//
//  ContentView.swift
//  Watchlist SwiftUI MasterClass
//
//  Created by Aran Fononi on 31/3/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - Properties
    
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    
    var body: some View {
        List {
            
        } // List
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        } // Overlay
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
