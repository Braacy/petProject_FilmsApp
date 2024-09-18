//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    
    var transition: RoundingTransition = RoundingTransition()
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var galleryCollection: UICollectionView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var receivedIndex: Int = Int()
    
    var cameFromFav: Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cameFromFav {
            posterImageView.image = UIImage(named: Model().showLikedItems()[receivedIndex].testPic ?? "image5")
            filmTitleLabel.text = Model().showLikedItems()[receivedIndex].testTitle
            releaseYearLabel.text = Model().showLikedItems()[receivedIndex].testYear
            ratingLabel.text = Model().showLikedItems()[receivedIndex].testRating
        } else {
            posterImageView.image = UIImage(named: Model().ratingSort()[receivedIndex].testPic ?? "image5")
            filmTitleLabel.text = Model().ratingSort()[receivedIndex].testTitle
            releaseYearLabel.text = Model().ratingSort()[receivedIndex].testYear
            ratingLabel.text = Model().ratingSort()[receivedIndex].testRating
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .show
        transition.start = posterImageView.center
        transition.roundColor = UIColor.lightGray
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .cancel
        transition.start = posterImageView.center
        transition.roundColor = UIColor.lightGray
        
        return transition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? PosterFullViewController else {
            return
        }
        destVC.detailIndexPath = receivedIndex
        
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
        
    }
    
    
    @IBAction func tapGestureAction(_ sender: Any) {
    }
    
}
