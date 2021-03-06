//
//  MovieTableViewCell.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movieModel: Result) {
        movieImage.downloaded(from: movieModel.posterPath ?? "")
        titleLabel.text = movieModel.title
        overViewLabel.text = movieModel.overview
        dateLabel.text = movieModel.releaseDate
    }
    
    func configureLocal(with movieModel: Result) {
        if let imageData = movieModel.posterData {
            movieImage.image = UIImage(data: imageData)
        }
        
        titleLabel.text = movieModel.title
        overViewLabel.text = movieModel.overview
        dateLabel.text = movieModel.releaseDate
    }
    
}
