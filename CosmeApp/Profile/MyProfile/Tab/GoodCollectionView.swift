//
//  GoodCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol GoodCollectionViewDelegate: NSObjectProtocol{
    func didSelectItemAtGood(indexPath: IndexPath)
}
extension GoodCollectionViewDelegate {
}
// MARK: - Property
class GoodCollectionView: BaseView {
    weak var delegate: GoodCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var noticeModels: [NoticeModel] = [NoticeModel]()
}
// MARK: - Life cycle
extension GoodCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "GoodCollectionViewCell")
    }
}
// MARK: - Protocol
extension GoodCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticeModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodCollectionViewCell", for: indexPath) as? GoodCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(noticeModel: noticeModels[indexPath.row])
        return cell
    }
    
}
extension GoodCollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtGood(indexPath:indexPath)}
    }
}
// MARK: - method
extension GoodCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
    }
    func getModel(noticeModels: [NoticeModel]) {
        self.noticeModels = noticeModels
        collectionView.reloadData()
    }
}
