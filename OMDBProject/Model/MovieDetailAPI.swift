//
//  MovieDetailAPI.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import UIKit

class MovieDetail {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    let baseURL = URL(string: "http://www.omdbapi.com/?")!
    
    var movie: Movie?
    
    func fetchMovieInfo(imdbID: String, completion: @escaping () -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let movieQueryItem = URLQueryItem(name: "i", value: imdbID)
        let plotQuertyItem = URLQueryItem(name: "plot", value: "full")
        let apiQueryItem = URLQueryItem(name: "apikey", value: apiKey.apiKey)
        urlComponents?.queryItems = [movieQueryItem, plotQuertyItem, apiQueryItem]
        
        guard let requestURL = urlComponents?.url else { return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                print("Error fetching data: \(error!)")
                completion()
                return
            }
            
            guard let data = data else {
                print("Error: no data returned from task")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let movieData = try jsonDecoder.decode(Movie.self, from: data)
                self.movie = movieData
            } catch {
                print("Error: unable to decode data: \(error)")
            }
            
            completion()
        }.resume()
    }
    
}
