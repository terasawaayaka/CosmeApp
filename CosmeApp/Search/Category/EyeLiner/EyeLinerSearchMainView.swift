//
//  EyeLinerSearchMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol EyeLinerSearchMainViewDelegate: NSObjectProtocol{
}
extension EyeLinerSearchMainViewDelegate {
}
// MARK: - Property
class EyeLinerSearchMainView: BaseView {
    weak var delegate: EyeLinerSearchMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFloeLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension EyeLinerSearchMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFloeLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 150)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SearchResultCollectionViewCell")
    }
}
// MARK: - Protocol
extension EyeLinerSearchMainView: UICollectionViewDataSource {
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
extension EyeLinerSearchMainView {
    func setDelegate(){
        collectionView.dataSource = self
    }
}

