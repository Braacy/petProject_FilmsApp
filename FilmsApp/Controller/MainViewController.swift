//
//  MainViewController.swift
//  FilmsApp
//
//  Created by Владислав  on 26.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
    

    @IBOutlet weak var mainViewController: UICollectionView!
    
    var searchController = UISearchController()
    
    let apiKey = "600f58ea7889cea5d35e94a17fad76c8"
    
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.newTestArray = model.testArray
        model.ratingSort()
        mainViewController.reloadData()
        
        mainViewController.dataSource = self
        mainViewController.delegate = self
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        mainViewController.register(xibCell, forCellWithReuseIdentifier: "FilmCell")
        mainViewController.reloadData()
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Find Your Film"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    @IBAction func sortingButtonAction(_ sender: Any) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        model.sortAscending = !model.sortAscending
        
        sortingButton.image = model.sortAscending ? arrowUp : arrowDown
        
        model.ratingSort()
        
        mainViewController.reloadData()
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.newTestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainViewController.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as?
                FilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.data = self.model.newTestArray[indexPath.item]
//        cell.posterPreviewImageView.image = UIImage(named: Model().testArray[indexPath.row].testPic ?? "image1")
//        cell.filmTitleLabel.text = Model().testArray[indexPath.row].testTitle
//        cell.realeaseYearLabel.text = String(Model().testArray[indexPath.row].testYear ?? 0000)
//        cell.ratingLabel.text = String(Model().testArray[indexPath.row].testRating ?? 0.0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }
        destViewController.receivedIndex = model.newTestArray[indexPath.row].id ?? 0
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
    
}
