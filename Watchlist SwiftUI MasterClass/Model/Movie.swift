//
//  Movie.swift
//  Watchlist SwiftUI MasterClass
//
//  Created by Aran Fononi on 31/3/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}
