//
//  Watchlist_SwiftUI_MasterClassApp.swift
//  Watchlist SwiftUI MasterClass
//
//  Created by Aran Fononi on 31/3/25.
//

import SwiftUI
import SwiftData

@main
struct Watchlist_SwiftUI_MasterClassApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
