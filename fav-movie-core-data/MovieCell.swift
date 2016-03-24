//
//  MovieCell.swift
//  fav-movie-core-data
//
//  Created by Vyacheslav Horbach on 24/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImdbLbl: UILabel!
    @IBOutlet weak var movieCommentLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(movie: Movie) {
        movieImg.image = movie.getMovieImg()
        movieImdbLbl.text = movie.imdb
        movieTitleLbl.text = movie.title
        movieCommentLbl.text = movie.comment
    }

}
