//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 04.09.2024.
//

import UIKit

class PosterFullViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var fullPosterImageView: UIImageView!
    
    var detailIndexPath: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullPosterImageView.image = UIImage(named: testArray[detailIndexPath].testPic ?? "image1")
    }
    

    

}
