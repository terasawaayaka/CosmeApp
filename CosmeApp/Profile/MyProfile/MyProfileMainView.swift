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
}
extension MyProfileMainViewDelegate {
}
// MARK: - Property
class MyProfileMainView: BaseView {
    weak var delegate: MyProfileMainViewDelegate? = nil
    //Outlet
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowlayout: UICollectionViewFlowLayout!
    
    //Action
    @IBAction func EditProfileButton(_ sender: UIButton) {
    }
}
// MARK: - Life cycle
extension MyProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowlayout.estimatedItemSize = CGSize(width: todayCollectionView.frame.width, height: todayCollectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: todayCollectionView, cellName: "TodayCollectionViewCell")
    }
}
//MARK: - Protocol
extension MyProfileMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as? TodayCollectionViewCell else {return UICollectionViewCell()}

        return cell
    }

}

// MARK: - method
extension MyProfileMainView {
    func setDelegate() {
        todayCollectionView.dataSource = self
        
    }
}
