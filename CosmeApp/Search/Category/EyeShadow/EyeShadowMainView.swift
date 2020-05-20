//
//  EyeShadowMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol EyeShadowMainViewDelegate: NSObjectProtocol{
}
extension EyeShadowMainViewDelegate {
}
// MARK: - Property
class EyeShadowMainView: BaseView {
    weak var delegate: EyeShadowMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
}
// MARK: - Life cycle
extension EyeShadowMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension EyeShadowMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath) as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension EyeShadowMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

