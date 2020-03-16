//
//  MovieTableViewCell.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    func updateViews() {
        titleLabel.text = movie?.title
        yearLabel.text = movie?.year
        ratingLabel.text = movie?.rated
        runtimeLabel.text = movie?.runTime
        scoreLabel.text = movie?.score
        directorLabel.text = movie?.director
        actorsLabel.text = movie?.actors
        plotTextView.text = movie?.plot
    }
    
}
