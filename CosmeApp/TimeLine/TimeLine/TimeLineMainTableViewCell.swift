//
//  TimeLineMainTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainTableViewCellDelegate: NSObjectProtocol{
    func didSelectItemAt()
}
extension TimeLineMainTableViewCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewCell: BaseTableViewCell {
    weak var delegate: TimeLineMainTableViewCellDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension TimeLineMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        setLayout()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "TimeLineMainCollectionViewCell")
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewCell :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeLineMainCollectionViewCell", for: indexPath) as? TimeLineMainCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
}

extension TimeLineMainTableViewCell :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {delegate.didSelectItemAt()}
    }
    
    
}
// MARK: - method
extension TimeLineMainTableViewCell {
    func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func setLayout(){
        collectionViewFlowLayout.estimatedItemSize = CGSize(width:80,height:80)
    }
}
