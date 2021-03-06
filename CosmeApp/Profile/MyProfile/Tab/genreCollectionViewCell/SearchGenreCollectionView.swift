//
//  SearchGenreCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/01.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchGenreCollectionViewDelegate: NSObjectProtocol{
    func didSelectItemAtSearchGenre(indexPath: IndexPath)
    
}
extension SearchGenreCollectionViewDelegate {
}
// MARK: - Property
class SearchGenreCollectionView: BaseView {
    weak var delegate: SearchGenreCollectionViewDelegate? = nil
    //Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var textLabel: UILabel!
    
    //data
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension SearchGenreCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchGenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension SearchGenreCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchGenreCollectionViewCell", for: indexPath) as? SearchGenreCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(reviewPostModel: reviewPostModels[indexPath.row])
        return cell
    }
    
}

extension SearchGenreCollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtSearchGenre(indexPath: indexPath)}
    }
}
// MARK: - method
extension SearchGenreCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func getModel(reviewPostModels: [ReviewPostModel]) {
        self.reviewPostModels = reviewPostModels
        collectionView.reloadData()
        
        if reviewPostModels.count == 0 {
            textLabel.text = "投稿がありません"
        } else {
            textLabel.text = ""
        }
    }
}
