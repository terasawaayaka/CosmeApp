//
//  SearchYourGenreMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/16.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchYourGenreMainViewDelegate: NSObjectProtocol{
    func didSelectItemAtSearchYourGenre(indexPath: IndexPath)
}
extension SearchYourGenreMainViewDelegate {
}
// MARK: - Property
class SearchYourGenreMainView: BaseView {
    weak var delegate: SearchYourGenreMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var makePostModels: [MakePostModel] = [MakePostModel]()
}
// MARK: - Life cycle
extension SearchYourGenreMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchYourGenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension SearchYourGenreMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return makePostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchYourGenreCollectionViewCell", for: indexPath) as? SearchYourGenreCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(makePostModel: makePostModels[indexPath.row])
        return cell
    }
    
}
extension SearchYourGenreMainView :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtSearchYourGenre(indexPath: indexPath)}
    }
}
// MARK: - method
extension SearchYourGenreMainView {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func getModel(makePostModels: [MakePostModel]) {
        self.makePostModels = makePostModels
        collectionView.reloadData()
    }
}
