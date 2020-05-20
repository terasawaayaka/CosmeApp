//
//  YourScrollMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourScrollMainViewDelegate: NSObjectProtocol{
}
extension YourScrollMainViewDelegate {
}
// MARK: - Property
class YourScrollMainView: BaseView {
    weak var delegate: YourScrollMainViewDelegate? = nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var yourPostMainView: UIView!
    @IBOutlet weak var yourGenreMainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension YourScrollMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "YourPostCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "YourGenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension YourScrollMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourPostCollectionViewCell", for: indexPath) as? YourPostCollectionViewCell else {return UICollectionViewCell()}
        
        guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourGenreCollectionViewCell", for: indexPath) as? YourGenreCollectionViewCell else {return UICollectionViewCell()}
        
        switch indexPath.row {
        case 0:
            return cell
        case 3:
            return secondCell
        default:
            return cell
        }
    }
    
}
// MARK: - method
extension YourScrollMainView {
    func setDelegate() {
        collectionView.dataSource = self
    }
}
