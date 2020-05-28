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
    func didSelectItemAt(indexPath:IndexPath)
}
extension TimeLineMainTableViewCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewCell: BaseTableViewCell {
    weak var delegate: TimeLineMainTableViewCellDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var makePostModels : [MakePostModel] = [MakePostModel]()
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
        return makePostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeLineMainCollectionViewCell", for: indexPath) as? TimeLineMainCollectionViewCell else {return UICollectionViewCell()}
        cell.updatecollectionView(makePostModel: makePostModels[indexPath.row])
        return cell
    }
}

extension TimeLineMainTableViewCell :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {delegate.didSelectItemAt(indexPath: indexPath)}
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
    func updateCell(makePostModels:[MakePostModel]){
        self.makePostModels = makePostModels
        collectionView.reloadData()
    }
}
