//
//  Movies.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Movies {
    let movieResults: [Movie]
}

struct Movie {
    let title: String
    let year: String
    let runTime: String
    let director: String
    let actors: String
    let plot: String
    let poster: String
    let score: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case score = "Metascore"
    }
}
