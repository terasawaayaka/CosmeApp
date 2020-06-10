//
//  BookmarkCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol BookmarkCollectionViewDelegate: NSObjectProtocol{
    func didSelectItemAtBookmark(indexPath:IndexPath)
}
extension BookmarkCollectionViewDelegate {
}
// MARK: - Property
class BookmarkCollectionView: BaseView {
    weak var delegate: BookmarkCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension BookmarkCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "BookmarkCollectionViewCell")
    }
}
// MARK: - Protocol
extension BookmarkCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookmarkCollectionViewCell", for: indexPath) as? BookmarkCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(reviewPostModel: reviewPostModels[indexPath.row])
        return cell
    }
    
}
extension BookmarkCollectionView :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtBookmark(indexPath: indexPath)}
    }
}
// MARK: - method
extension BookmarkCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func getModel(reviewPostModels: [ReviewPostModel]) {
        self.reviewPostModels = reviewPostModels
        collectionView.reloadData()
    }
}

