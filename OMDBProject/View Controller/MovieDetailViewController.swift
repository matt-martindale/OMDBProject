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
    @IBOutlet weak var posterImage: UIImageView!
    
    var movieDetail = MovieDetail()
    var imdbID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imdb = imdbID else { return }
        movieDetail.fetchMovieInfo(imdbID: imdb) {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    func updateView() {
        titleLabel.text = movieDetail.movie?.title
        yearLabel.text = movieDetail.movie?.year
        ratedLabel.text = movieDetail.movie?.rated
        runTimeLabel.text = movieDetail.movie?.runTime
        directorLabel.text = movieDetail.movie?.director
        actorLabel.text = movieDetail.movie?.actors
        metaScoreLabel.text = "\(movieDetail.movie?.metaScore ?? "-")/100"
        plotTextView.text = movieDetail.movie?.plot
        getPosterImage()
    }
    
    func getPosterImage() {
        guard let poster = movieDetail.movie?.poster else { return }
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
