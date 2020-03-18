//
//  Movies.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct MovieSearch: Codable {
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

struct Movie: Codable {
    let title: String?
    let year: String?
    let rated: String?
    let runTime: String?
    let director: String?
    let actors: String?
    let plot: String?
    let poster: String?
    let metaScore: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case runTime = "Runtime"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case metaScore = "Metascore"
    }
}

struct Movies: Codable {
    let search: [MovieSearch]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
