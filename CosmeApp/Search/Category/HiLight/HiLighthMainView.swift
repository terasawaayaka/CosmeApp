//
//  HiLighthMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol HiLighthMainViewDelegate: NSObjectProtocol{
}
extension HiLighthMainViewDelegate {
}
// MARK: - Property
class HiLighthMainView: BaseView {
    weak var delegate: HiLighthMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
}
// MARK: - Life cycle
extension HiLighthMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension HiLighthMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultCollectionViewCell", for: indexPath)
            as? SearchResultCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension HiLighthMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

