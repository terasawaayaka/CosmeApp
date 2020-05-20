//
//  EyeBrowSearchMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol EyeBrowSearchMainViewDelegate: NSObjectProtocol{
}
extension EyeBrowSearchMainViewDelegate {
}
// MARK: - Property
class EyeBrowSearchMainView: BaseView {
    weak var delegate: EyeBrowSearchMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
}
// MARK: - Life cycle
extension EyeBrowSearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension EyeBrowSearchMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension EyeBrowSearchMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

