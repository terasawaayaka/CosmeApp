//
//  BrandSearchResultView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol BrandSearchResultViewDelegate: NSObjectProtocol{
    func touchedBrandCellButton()
}
extension BrandSearchResultViewDelegate {
}
// MARK: - Property
class BrandSearchResultView: BaseView {
    weak var delegate: BrandSearchResultViewDelegate? = nil
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension BrandSearchResultView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: brandCollectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension BrandSearchResultView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        cell.delegate = self
        cell.updateReviewCell(reviewPostModel: reviewPostModels[indexPath.row])
        return cell
    }
}
extension BrandSearchResultView: SearchResultCollectionViewCellDelegate {
    func touchedCellButton() {
        if let delegate = delegate {
             delegate.touchedBrandCellButton()
         }
    }
}
// MARK: - method
extension BrandSearchResultView {
    func setDelegate(){
        brandCollectionView.dataSource = self
    }
    func getReviewPostModel(reviewPostModels: [ReviewPostModel]){
    self.reviewPostModels = reviewPostModels
    brandCollectionView.reloadData()
    }
}

