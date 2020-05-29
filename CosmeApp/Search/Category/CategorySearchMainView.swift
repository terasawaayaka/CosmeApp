//
//  CategorySearchMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/21.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol CategorySearchMainViewDelegate: NSObjectProtocol{
//    func didSelectItemAt(indexPath: IndexPath)
    func touchedCellButton(reviewPostModel: ReviewPostModel)
}
extension CategorySearchMainViewDelegate {
}
// MARK: - Property
class CategorySearchMainView: BaseView {
    weak var delegate: CategorySearchMainViewDelegate? = nil
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var illustImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension CategorySearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: 1, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension CategorySearchMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        cell.updateReviewCell(reviewPostModel: reviewPostModels[indexPath.row])
        cell.delegate = self
        return cell
    }
}

//extension CategorySearchMainView: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let delegate = delegate {
//            delegate.didSelectItemAt(indexPath: indexPath)
//        }
//    }
//}
extension CategorySearchMainView: SearchResultCollectionViewCellDelegate {
    func touchedCellButton(reviewPostModel: ReviewPostModel) {
         if let delegate = delegate {
               delegate.touchedCellButton(reviewPostModel: reviewPostModel)
           }
    }
    
}
    
    
// MARK: - method
extension CategorySearchMainView {
    func setDelegate(){
        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    func getReviewPostModel(reviewPostModels: [ReviewPostModel]){
        self.reviewPostModels = reviewPostModels
        collectionView.reloadData()
    }
}

