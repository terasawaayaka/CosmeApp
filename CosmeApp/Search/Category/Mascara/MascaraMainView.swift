//
//  MascaraMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol MascaraMainViewDelegate: NSObjectProtocol{
}
extension MascaraMainViewDelegate {
}
// MARK: - Property
class MascaraMainView: BaseView {
    weak var delegate: MascaraMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension MascaraMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension MascaraMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension MascaraMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

