//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {

    let model = Model()
    
    @IBOutlet weak var favoriteViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.showIsLiked()
        
        model.isLikedArray = model.testArray
        model.ratingSort()
        favoriteViewController.reloadData()
        
        favoriteViewController.delegate = self
        favoriteViewController.dataSource = self
        
        let xibCell = UINib(nibName: "FavFilmViewCell", bundle: nil)
        favoriteViewController.register(xibCell, forCellWithReuseIdentifier: "FavCell")
        favoriteViewController.reloadData()
    }
    

}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.isLikedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteViewController.dequeueReusableCell(withReuseIdentifier: "FavCell", for: indexPath) as? FavFilmViewCell else {
            return UICollectionViewCell()
        }
        
        cell.data = self.model.isLikedArray[indexPath.item]
        
//        cell.favFilmImageView.image = UIImage(named: Model().showIsLiked()[indexPath.item].testPic ?? "image1")
//        cell.favFilmTitle.text = Model().showIsLiked()[indexPath.item].testTitle
//        cell.favRealeaseYEar.text = String(Model().showIsLiked()[indexPath.item].testYear ?? 0000)
//        cell.favRatingLabel.text = String(Model().showIsLiked()[indexPath.item].testRating ?? 0.0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }
        destViewController.receivedIndex = model.isLikedArray[indexPath.row].id ?? 0
        
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
}
