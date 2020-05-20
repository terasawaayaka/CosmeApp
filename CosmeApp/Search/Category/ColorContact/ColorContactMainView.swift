//
//  ColorContactMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ColorContactMainViewDelegate: NSObjectProtocol{
}
extension ColorContactMainViewDelegate {
}
// MARK: - Property
class ColorContactMainView: BaseView {
    weak var delegate: ColorContactMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension ColorContactMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension ColorContactMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension ColorContactMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

