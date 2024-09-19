//
//  MainViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainViewController: UICollectionView!
    @IBOutlet weak var filmSearchBar: UISearchBar!
    
    let apiKey = "600f58ea7889cea5d35e94a17fad76c8"
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController.dataSource = self
        mainViewController.delegate = self
        
        filmSearchBar.delegate = self
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        mainViewController.register(xibCell, forCellWithReuseIdentifier: "FilmCell")
        mainViewController.reloadData()
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model().testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainViewController.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as?
                FilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.posterPreviewImageView.image = UIImage(named: Model().testArray[indexPath.row].testPic ?? "image1")
        cell.filmTitleLabel.text = Model().testArray[indexPath.row].testTitle
        cell.realeaseYearLabel.text = Model().testArray[indexPath.row].testYear
        cell.ratingLabel.text = Model().testArray[indexPath.row].testRating
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }
        destViewController.receivedIndex = indexPath.row
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
    
}
