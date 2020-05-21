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
    func didSelectItemAt()
}
extension BrandSearchResultViewDelegate {
}
// MARK: - Property
class BrandSearchResultView: BaseView {
    weak var delegate: BrandSearchResultViewDelegate? = nil
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
}
extension BrandSearchResultView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectItemAt()}
    }
}
// MARK: - method
extension BrandSearchResultView {
    func setDelegate(){
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
    }
}

