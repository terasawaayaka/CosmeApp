//
//  YourGenreCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourGenreCollectionViewDelegate: NSObjectProtocol{
}
extension YourGenreCollectionViewDelegate {
}
// MARK: - Property
class YourGenreCollectionView: BaseView {
    weak var delegate: YourGenreCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension YourGenreCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "YourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SecondYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "ThirdYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "FourthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "FifthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SixthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SeventhYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "EighthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "NinthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "TenthYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "ElevenYourGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "TwelveYourGenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension YourGenreCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourGenreCollectionViewCell", for: indexPath) as? YourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondYourGenreCollectionViewCell", for: indexPath) as? SecondYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdYourGenreCollectionViewCell", for: indexPath) as? ThirdYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthYourGenreCollectionViewCell", for: indexPath) as? FourthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let fifthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FifthYourGenreCollectionViewCell", for: indexPath) as? FifthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let sixthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SixthYourGenreCollectionViewCell", for: indexPath) as? SixthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let seventhCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeventhYourGenreCollectionViewCell", for: indexPath) as? SeventhYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let eighthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EighthYourGenreCollectionViewCell", for: indexPath) as? EighthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let ninthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NinthYourGenreCollectionViewCell", for: indexPath) as? NinthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let tenthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TenthYourGenreCollectionViewCell", for: indexPath) as? TenthYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let elevenCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElevenYourGenreCollectionViewCell", for: indexPath) as? ElevenYourGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let twelveCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelveYourGenreCollectionViewCell", for: indexPath) as? TwelveYourGenreCollectionViewCell else {return UICollectionViewCell()}
        
        switch indexPath.row {
        case 0:
            return cell
        case 1:
            return secondCell
        case 2:
            return thirdCell
        case 3:
            return fourthCell
        case 4:
            return fifthCell
        case 5:
            return sixthCell
        case 6:
            return seventhCell
        case 7:
            return eighthCell
        case 8:
            return ninthCell
        case 9:
            return tenthCell
        case 10:
            return elevenCell
        case 11:
            return twelveCell
        default:
            return cell
        }
        
    }
}
// MARK: - method
extension YourGenreCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
    }
}
