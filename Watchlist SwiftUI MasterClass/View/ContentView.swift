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
            if !movies.isEmpty {
                Section( header: VStack {
                    Text("Watchlist")
                        .font(.largeTitle.weight(.black))
                        .foregroundStyle(.blue.gradient)
                        .padding()
                    HStack {
                        Label("Title", systemImage: "movieclapper")
                        Spacer()
                        Label("Genre", systemImage: "tag")
                    }
                }) {
                    ForEach(movies) { movie in
                        HStack{
                            Text(movie.title)
                                .font(.title.weight(.light))
                                .padding(.vertical, 2)
                            
                            Spacer()
                            
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal,6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
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
                }
            } // Condition
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
