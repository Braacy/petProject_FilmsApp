//
//  FavFilmCollectionViewCell.swift
//  FilmsApp
//
//  Created by Владислав  on 18.09.2024.
//

import UIKit

class FavFilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favPosterPreviewImageView: UIImageView!
    @IBOutlet weak var favFilmTitleLabel: UILabel!
    @IBOutlet weak var favRatingLabel: UILabel!
    @IBOutlet weak var favRealeaseYear: UILabel!
    
    
    
    @IBAction func deleteFavFilmBtnAction(_ sender: Any) {
    }
    
}
