//
//  Network.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

let apiKey = APIKey()

class MovieController {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    let baseURL = URL(string: "http://www.omdbapi.com/?apikey=[\(apiKey)]&")!
    
    var movies: [Movie] = []
    
    func performSearch(searchTerm: String, completion: @escaping () -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryItem = URLQueryItem(name: "s", value: searchTerm)
        urlComponents?.queryItems = [queryItem]
        
        guard let requestURL = urlComponents?.url else { return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("There was an error fetching data: \(error)")
                completion()
            }
            
            guard let data = data else {
                print("Error: no data returned from data task")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let movieResults = try jsonDecoder.decode(Movies.self, from: data)
                self.movies = movieResults.movieResults
            } catch {
                print("Error: unable to decode data: \(error)")
            }
            
            completion()
            
        }.resume()
    }
}
