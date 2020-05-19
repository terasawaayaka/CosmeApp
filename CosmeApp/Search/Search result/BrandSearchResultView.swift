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
}
extension BrandSearchResultViewDelegate {
}
// MARK: - Property
class BrandSearchResultView: BaseView {
    weak var delegate: BrandSearchResultViewDelegate? = nil
    @IBOutlet weak var brandCollectionView: UICollectionView!
}
// MARK: - Life cycle
extension BrandSearchResultView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: brandCollectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension BrandSearchResultView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension BrandSearchResultView {
    func setDelegate(){
        brandCollectionView.dataSource = self
    }
}

