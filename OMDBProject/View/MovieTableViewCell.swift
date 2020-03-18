//
//  MovieTableViewCell.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movieSearch: MovieSearch? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    func updateViews() {
        titleLabel.text = movieSearch?.title
        yearLabel.text = movieSearch?.year
        getPosterImage()
    }
    
    func getPosterImage() {
        guard let poster = movieSearch?.poster else { return }
        if let url = URL(string: poster) {
            do {
                let data = try Data(contentsOf: url)
                self.posterImage.image = UIImage(data: data)
            } catch let err {
                print("Error loading poster image: \(err.localizedDescription)")
            }
        }
    }
    
}
