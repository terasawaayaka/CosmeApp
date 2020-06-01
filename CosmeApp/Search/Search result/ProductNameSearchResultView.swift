//
//  ProductNameSearchResultView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ProductNameSearchResultViewDelegate: NSObjectProtocol{
    func touchedProductNAmeCellButton(reviewPostModel: ReviewPostModel)
}
extension ProductNameSearchResultViewDelegate {
}
// MARK: - Property
class ProductNameSearchResultView: BaseView {
    weak var delegate: ProductNameSearchResultViewDelegate? = nil
    @IBOutlet weak var productNameCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension ProductNameSearchResultView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: productNameCollectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension ProductNameSearchResultView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        cell.delegate = self
        cell.updateReviewCell(reviewPostModel: reviewPostModels[indexPath.row])
        return cell
    }
}

extension ProductNameSearchResultView: SearchResultCollectionViewCellDelegate {
    func touchedCellButton(reviewPostModel: ReviewPostModel) {
          if let delegate = delegate {
                  delegate.touchedProductNAmeCellButton(reviewPostModel: reviewPostModel)}
    }
}
// MARK: - method
extension ProductNameSearchResultView {
    func setDelegate(){
        productNameCollectionView.dataSource = self
    }
    func getReviewPostModel(reviewPostModels: [ReviewPostModel],text: String!=nil){
        let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
            
            if let text = text {
                return reviewPostModel.title.contains(text)
            } else {
                return false
            }
        }

        self.reviewPostModels = filterdReviewPostModels
        productNameCollectionView.reloadData()
    }
}

