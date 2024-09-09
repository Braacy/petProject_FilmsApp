//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var galleryCollection: UICollectionView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func tapGestureAction(_ sender: Any) {
    }
    
}
