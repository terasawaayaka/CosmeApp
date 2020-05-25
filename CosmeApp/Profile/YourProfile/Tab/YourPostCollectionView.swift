//
//  YourPostCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourPostCollectionViewDelegate: NSObjectProtocol{
}
extension YourPostCollectionViewDelegate {
}
// MARK: - Property
class YourPostCollectionView: BaseView {
    weak var delegate: YourPostCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension YourPostCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
      collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
      loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "YourPostCollectionViewCell")
    }
}
// MARK: - Protocol
extension YourPostCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourPostCollectionViewCell", for: indexPath) as? YourPostCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension YourPostCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
    }
}
