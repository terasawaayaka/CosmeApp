//
//  YourProfileMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourProfileMainViewDelegate: NSObjectProtocol{
    func touchedPostButton()
    func touchedGenreButton()
}
extension YourProfileMainViewDelegate {
}
// MARK: - Property
class YourProfileMainView: BaseView {
    weak var delegate: YourProfileMainViewDelegate? = nil
    //Outlet
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var yourTodayCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var scrollMainView: YourScrollMainView!
    
    //Action
    @IBAction func touchedPostedButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedPostButton()}
    }
    @IBAction func touchedGenreButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedGenreButton()}
    }
}
// MARK: - Life cycle
extension YourProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: yourTodayCollectionView.frame.width, height: yourTodayCollectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: yourTodayCollectionView, cellName: "YourTodayCollectionViewCell")
    }
}
// MARK: - Protocol
extension YourProfileMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourTodayCollectionViewCell", for: indexPath) as? YourTodayCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
}
// MARK: - method
extension YourProfileMainView {
    func setDelegate() {
        yourTodayCollectionView.dataSource = self
    }
}
