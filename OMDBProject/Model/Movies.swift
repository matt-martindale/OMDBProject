//
//  Movies.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let movieResults: [Movie]
}

struct Movie: Decodable {
    let title: String
    let year: String
    let rating: String
    let runTime: String
    let director: String
    let actors: String
    let plot: String
    let score: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rating = "Rating"
        case runTime = "Runtime"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case score = "Metascore"
    }
}
