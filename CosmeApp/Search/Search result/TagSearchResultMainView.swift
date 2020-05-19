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
}
extension TagSearchResultMainViewDelegate {
}
// MARK: - Property
class TagSearchResultMainView: BaseView {
    weak var delegate: TagSearchResultMainViewDelegate? = nil
    @IBOutlet weak var tagCollectionView: UICollectionView!
}
// MARK: - Life cycle
extension TagSearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: tagCollectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension TagSearchResultMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension TagSearchResultMainView {
    func setDelegate(){
        tagCollectionView.dataSource = self
    }
}

