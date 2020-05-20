//
//  ScrollMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ScrollMainViewDelegate: NSObjectProtocol{
}
extension ScrollMainViewDelegate {
}
// MARK: - Property
class ScrollMainView: BaseView {
    weak var delegate: ScrollMainViewDelegate? = nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var goodMainView: UIView!
    @IBOutlet weak var bookMarkMainView: UIView!
    @IBOutlet weak var genreMainView: UIView!
    @IBOutlet weak var goodCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension ScrollMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
      //  collectionViewFlowLayout.estimatedItemSize = CGSize(width: goodCollectionView.frame.height, height: goodCollectionView.frame.width)
        loadCollectionViewCellFromXib(collectionView: goodCollectionView, cellName: "GoodCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: goodCollectionView, cellName: "BookmarkCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: goodCollectionView, cellName: "GenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension ScrollMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodCollectionViewCell", for: indexPath) as? GoodCollectionViewCell else {return UICollectionViewCell()}
        guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookmarkCollectionViewCell", for: indexPath) as? BookmarkCollectionViewCell else {return UICollectionViewCell()}
        guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as? GenreCollectionViewCell else {return UICollectionViewCell()}
        switch indexPath.row {
        case 0:
            return cell
        case 3:
            return secondCell
        case 6:
            return thirdCell
        default:
            return cell
        }
    }
    
}
// MARK: - method
extension ScrollMainView {
    func setDelegate() {
        goodCollectionView.dataSource = self
    }
}
