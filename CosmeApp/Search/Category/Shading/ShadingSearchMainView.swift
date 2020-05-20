//
//  ShadingSearchMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ShadingSearchMainViewDelegate: NSObjectProtocol{
}
extension ShadingSearchMainViewDelegate {
}
// MARK: - Property
class ShadingSearchMainView: BaseView {
    weak var delegate: ShadingSearchMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
}
// MARK: - Life cycle
extension ShadingSearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension ShadingSearchMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension ShadingSearchMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

