//
//  Model.swift
//  FilmsApp
//
//  Created by Владислав  on 19.09.2024.
//

import UIKit

class Item {
    var id: Int?
    var testPic: String?
    var testTitle: String?
    var testYear: Int?
    var testRating: Double?
    var isLiked: Bool
    
    init(id: Int?, testPic: String? = nil, testTitle: String? = nil, testYear: Int? = nil, testRating: Double? = nil, isLiked: Bool) {
        self.id = id
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
        self.isLiked = isLiked
    }
}
class Model {
    
    var sortAscending: Bool = false
    
    var newTestArray: [Item] = []
    
    var isLikedArray: [Item] = []
    
    var testArray: [Item] = [
        Item(id: 0, testPic: "image1", testTitle: "Фильм 1", testYear: 2001, testRating: 4.7, isLiked: true),
        Item(id: 1, testPic: "image2", testTitle: "Фильм 2", testYear: 2002, testRating: 2.7, isLiked: false),
        Item(id: 2, testPic: "image3", testTitle: "Фильм 3", testYear: 2004, testRating: 7.7, isLiked: true),
        Item(id: 3, testPic: "image4", testTitle: "Фильм 4", testYear: 2006, testRating: 5.7, isLiked: false),
        Item(id: 4, testPic: "image5", testTitle: "Фильм 5", testYear: 2008, testRating: 1.7, isLiked: true),
        Item(id: 5, testPic: "image6", testTitle: "Фильм 6", testYear: 1999, testRating: 9.7, isLiked: false),
        Item(id: 6, testPic: "image7", testTitle: "Фильм 7", testYear: 2012, testRating: 6.7, isLiked: true),
        Item(id: 7, testPic: "image8", testTitle: "Фильм 8", testYear: 2011, testRating: 4.3, isLiked: false),
        Item(id: 8, testPic: "image9", testTitle: "Фильм 9", testYear: 2010, testRating: 4.5, isLiked: true),
        Item(id: 9, testPic: "image10", testTitle: "Фильм 10", testYear: 2022, testRating: 4.8, isLiked: false),
        Item(id: 10, testPic: "image11", testTitle: "Фильм 11", testYear: 2023, testRating: 4.1, isLiked: true),
        Item(id: 11, testPic: "image12", testTitle: "Фильм 12", testYear: 2018, testRating: 4.2, isLiked: false),
        Item(id: 12, testPic: "image13", testTitle: "Фильм 13", testYear: 2017, testRating: 4.0, isLiked: false),
        Item(id: 13, testPic: "image14", testTitle: "Фильм 14", testYear: 2016, testRating: 4.4, isLiked: false),
        Item(id: 14, testPic: "image15", testTitle: "Фильм 15", testYear: 2014, testRating: 4.6, isLiked: false)]
    
    func showIsLiked(){
        for i in testArray {
            if i.isLiked == true {
                isLikedArray.append(i)
            }
        }
    }
    
    func ratingSort() -> [Item] {
        self.testArray.sort {
            sortAscending ? ($0.testRating ?? 0) < ($1.testRating ?? 0) : ($0.testRating ?? 0) > ($1.testRating ?? 0)
        }
        newTestArray = testArray
        return newTestArray
    }
    
    func search(searchTextValue: String) {
        newTestArray = []
        
        if searchTextValue == "" {
            newTestArray = testArray
        }else {
            for item in testArray {
                guard let unwrItem = item.testTitle else {
                    return
                }
                if unwrItem.contains(searchTextValue) {
                    newTestArray.append(item)
                }
            }
        }
        newTestArray = testArray.filter({
            $0.testTitle?.range(of: searchTextValue, options: .caseInsensitive) != nil
        })
    }
    
}
