//
//  MyProfileMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol MyProfileMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt(indexPath: IndexPath)
}
extension MyProfileMainViewDelegate {
}
// MARK: - Property
class MyProfileMainView: BaseView {
    weak var delegate: MyProfileMainViewDelegate? = nil
    //Outlet
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var todayCollectionView: UICollectionView!
    
    //Action
    @IBAction func EditProfileButton(_ sender: UIButton) {
    }
}
// MARK: - Life cycle
extension MyProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        loadCollectionViewCellFromXib(collectionView: todayCollectionView, cellName: "TodayCollectionViewCell")
    }
}
// MARK: - Protocol
//extension MyProfileMainView :UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as? TodayCollectionViewCell else {return UICollectionViewCell()}
//
//        return cell
//    }
//
//}
//extension MyProfileMainView :UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let delegate = delegate{delegate.didSelectRowAt(indexPath :indexPath)}
//    }
//}
// MARK: - method
extension MyProfileMainView {
    func setDelegate() {
//        todayCollectionView.dataSource = self
//        todayCollectionView.delegate = self
    }
}
