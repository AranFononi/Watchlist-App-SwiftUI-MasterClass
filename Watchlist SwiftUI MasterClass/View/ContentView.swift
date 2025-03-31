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
    
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack{
                    Text(movie.title)
                    
                    Spacer()
                    
                    Text(movie.genre.name)
                } // List Row
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(movie)
                        }
                        
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        } // List
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        } // Overlay
        // MARK: - Safe Area
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button {
                withAnimation {
                    isSheetPresented.toggle()
                }
                
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        } // Safe Area
        // MARK: - Sheet
        .sheet(isPresented: $isSheetPresented) {
            NewMovieFormView()
        }
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Movie.preview)
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
