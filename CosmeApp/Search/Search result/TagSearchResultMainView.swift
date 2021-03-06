//
//  TagSearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TagSearchResultMainViewDelegate: NSObjectProtocol{
    func touchedCellButton(reviewPostModel: ReviewPostModel)
}
extension TagSearchResultMainViewDelegate {
}
// MARK: - Property
class TagSearchResultMainView: BaseView {
    weak var delegate: TagSearchResultMainViewDelegate? = nil
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension TagSearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: tagCollectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension TagSearchResultMainView: UICollectionViewDataSource {
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
extension TagSearchResultMainView: SearchResultCollectionViewCellDelegate {
    func touchedCellButton(reviewPostModel: ReviewPostModel) {
          if let delegate = delegate {
                  delegate.touchedCellButton(reviewPostModel: reviewPostModel)}
          }
    }
// MARK: - method
extension TagSearchResultMainView {
    func setDelegate(){
        tagCollectionView.dataSource = self
    }
    func getReviewPostModel(reviewPostModels: [ReviewPostModel],text: String?=nil) {
        let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
            
            if let text = text {
                return reviewPostModel.tag.contains(text)
            } else {
                return false
            }
        }
            
        if filterdReviewPostModels.count != 0 {
            print("検索結果がある")
            self.reviewPostModels = filterdReviewPostModels
        } else {
            print("検索結果がない")
            self.reviewPostModels = reviewPostModels
        }
        
        tagCollectionView.reloadData()
    }
}

