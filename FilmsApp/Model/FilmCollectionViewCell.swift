//
//  FilmCollectionViewCell.swift
//  FilmsApp
//
//  Created by Владислав  on 30.08.2024.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterPreviewImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var realeaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var data: Item? {
        didSet {
            guard data != nil else {
                return
            }
            posterPreviewImageView.image = UIImage(named: data?.testPic ?? "image1")
            filmTitleLabel.text = data?.testTitle
            realeaseYearLabel.text = String(data?.testYear ?? 0000)
            ratingLabel.text = String(data?.testRating ?? 0.0)
        }
    }
}
