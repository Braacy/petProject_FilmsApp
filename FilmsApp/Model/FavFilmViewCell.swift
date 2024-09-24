//
//  FavFilmViewCell.swift
//  FilmsApp
//
//  Created by Владислав  on 19.09.2024.
//

import UIKit

class FavFilmViewCell: UICollectionViewCell {
    @IBOutlet weak var favFilmImageView: UIImageView!
    @IBOutlet weak var favFilmTitle: UILabel!
    @IBOutlet weak var favRealeaseYEar: UILabel!
    @IBOutlet weak var favRatingLabel: UILabel!
    
    var data: Item? {
        didSet {
            guard data != nil else {
                return
            }
            favFilmImageView.image = UIImage(named: data?.testPic ?? "image1")
            favFilmTitle.text = data?.testTitle
            favRealeaseYEar.text = String(data?.testYear ?? 0000)
            favRatingLabel.text = String(data?.testRating ?? 0.0)
        }
    }
}
