//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let model = Model()
    
    var transition: RoundingTransition = RoundingTransition()
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var galleryCollection: UICollectionView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    var receivedIndex: Int = Int()
    
    var cameFromFav: Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if model.testArray[receivedIndex].isLiked == true {
            likeButton.alpha = 1
            likeButton.tintColor = .black
        } else {
            likeButton.alpha = 0.45
            likeButton.tintColor = .gray
        }
            posterImageView.image = UIImage(named: Model().testArray[receivedIndex].testPic ?? "image1")
            filmTitleLabel.text = Model().testArray[receivedIndex].testTitle
            releaseYearLabel.text = String(Model().testArray[receivedIndex].testYear ?? 0000)
            ratingLabel.text = String(Model().testArray[receivedIndex].testRating ?? 0.0)
        
           
        
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
        
    
        @IBAction func likeButtonAction(_ sender: Any) {
        }
    
    }
