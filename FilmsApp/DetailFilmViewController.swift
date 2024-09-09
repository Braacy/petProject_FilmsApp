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
    
    var receivedIndex: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posterImageView.image = UIImage(named: testArray[receivedIndex].testPic ?? "image1")
        filmTitleLabel.text = testArray[receivedIndex].testTitle
        releaseYearLabel.text = testArray[receivedIndex].testYear
        ratingLabel.text = testArray[receivedIndex].testRating
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? PosterFullViewController else {
            return
        }
        destVC.detailIndexPath = receivedIndex
    }
    
    
    @IBAction func tapGestureAction(_ sender: Any) {
    }
    
}
