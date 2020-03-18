//
//  MovieDetailViewController.swift
//  OMDBProject
//
//  Created by Matthew Martindale on 3/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var metaScoreLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    var movieDetail = MovieDetail()
    var imdbID: String?
    var movie: Movie? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imdb = imdbID else { return }
        movieDetail.fetchMovieInfo(imdbID: imdb) {
            
        }
    }
    
    func updateView() {
        titleLabel.text = movie?.title
        yearLabel.text = movie?.year
        ratedLabel.text = movie?.rated
        runTimeLabel.text = movie?.runTime
        directorLabel.text = movie?.director
        actorLabel.text = movie?.actors
        metaScoreLabel.text = movie?.metaScore
        plotTextView.text = movie?.plot
    }
    

}
