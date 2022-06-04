//
//  Movie.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 30.05.2022.
//

import Foundation

struct Movie : Codable {
    
    var title : String
    var year : String
    var imdbId: String
    var type : String
    var poster : String
    
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}


struct ComingMovies : Codable {
    let movies : [Movie]
    
    private enum CodingKeys : String, CodingKey {
        case movies = "Search"
    }
}
