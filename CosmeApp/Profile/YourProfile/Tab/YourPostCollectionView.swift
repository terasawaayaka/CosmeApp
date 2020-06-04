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
    func didSelectItemAt(indexPath: IndexPath)
}
extension YourPostCollectionViewDelegate {
}
// MARK: - Property
class YourPostCollectionView: BaseView {
    weak var delegate: YourPostCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    var userModel: UserModel = UserModel()
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
        return reviewPostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourPostCollectionViewCell", for: indexPath) as? YourPostCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(reviewPostModel: reviewPostModels[indexPath.row], userModel: userModel)
        return cell
    }
}

extension YourPostCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectItemAt(indexPath: indexPath)
        }
    }
}
// MARK: - method
extension YourPostCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func getModel(reviewPostModels: [ReviewPostModel],userModel: UserModel){
        let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
            if reviewPostModel.post_user_id == userModel.id {
                return true
            }else {
                return false
            }
        }
        
    self.reviewPostModels = filterdReviewPostModels
        self.userModel = userModel
        collectionView.reloadData()
    }
}
