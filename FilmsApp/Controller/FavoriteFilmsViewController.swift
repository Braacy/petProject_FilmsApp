//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {

    @IBOutlet weak var favoriteViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteViewController.delegate = self
        favoriteViewController.dataSource = self
        
        let xibCell = UINib(nibName: "FavFilmViewCell", bundle: nil)
        favoriteViewController.register(xibCell, forCellWithReuseIdentifier: "FavCell")
        favoriteViewController.reloadData()
    }
    

}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model().showIsLiked().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteViewController.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as? FavFilmViewCell else {
            return UICollectionViewCell()
        }
        
        cell.favFilmImageView.image = UIImage(named: Model().showIsLiked()[indexPath.item].testPic ?? "image1")
        cell.favFilmTitle.text = Model().showIsLiked()[indexPath.item].testTitle
        cell.favRealeaseYEar.text = Model().showIsLiked()[indexPath.item].testYear
        cell.favRatingLabel.text = Model().showIsLiked()[indexPath.item].testRating
        
        return cell
    }
    
    
}
