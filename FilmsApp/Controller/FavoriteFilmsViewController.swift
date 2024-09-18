//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {

    @IBOutlet weak var favoriteFilmViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteFilmViewController.dataSource = self
        favoriteFilmViewController.delegate = self
        
        let xibCell = UINib(nibName: "FavFilmsCollectionViewCell", bundle: nil)
        favoriteFilmViewController.register(xibCell, forCellWithReuseIdentifier: "FavCell")
        favoriteFilmViewController.reloadData()
    }
    
}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model().showLikedItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteFilmViewController.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as? FavFilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.favPosterPreviewImageView.image = UIImage(named: Model().showLikedItems()[indexPath.item].testPic ?? "image2")
        cell.favFilmTitleLabel.text = Model().showLikedItems()[indexPath.item].testTitle ?? "Терминатор"
        cell.favRealeaseYear.text = Model().showLikedItems()[indexPath.item].testYear ?? "0"
        cell.favRatingLabel.text = Model().showLikedItems()[indexPath.item].testRating ?? "0"
        
        return cell
    }
    
    
}
