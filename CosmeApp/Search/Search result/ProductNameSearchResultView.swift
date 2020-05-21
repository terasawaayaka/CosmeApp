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
    func didSelectItemAt()
}
extension ProductNameSearchResultViewDelegate {
}
// MARK: - Property
class ProductNameSearchResultView: BaseView {
    weak var delegate: ProductNameSearchResultViewDelegate? = nil
    @IBOutlet weak var productNameCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
}
extension ProductNameSearchResultView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectItemAt()
        }
    }
}
// MARK: - method
extension ProductNameSearchResultView {
    func setDelegate(){
        productNameCollectionView.dataSource = self
        productNameCollectionView.delegate = self
    }
}

