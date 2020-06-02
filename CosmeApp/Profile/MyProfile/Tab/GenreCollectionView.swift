//
//  GenreCollectionView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol GenreCollectionViewDelegate: NSObjectProtocol{
    func touchedEyeShadowButton()
}
extension GenreCollectionViewDelegate {
}
// MARK: - Property
class GenreCollectionView: BaseView {
    weak var delegate: GenreCollectionViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
}
// MARK: - Life cycle
extension GenreCollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "GenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SecondGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "ThirdCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "FourthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "FifthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SixthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "SeventhCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "EighthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "NinthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "TenthCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "ElevenGenreCollectionViewCell")
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "TwelveGenreCollectionViewCell")
    }
}
// MARK: - Protocol
extension GenreCollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as? GenreCollectionViewCell else {return UICollectionViewCell()}
        guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondGenreCollectionViewCell", for: indexPath) as? SecondGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as? ThirdCollectionViewCell else {return UICollectionViewCell()}
        guard let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthCollectionViewCell", for: indexPath) as? FourthCollectionViewCell else {return UICollectionViewCell()}
        guard let fifthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FifthCollectionViewCell", for: indexPath) as? FifthCollectionViewCell else {return UICollectionViewCell()}
         guard let sixthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SixthCollectionViewCell", for: indexPath) as? SixthCollectionViewCell else {return UICollectionViewCell()}
        guard let seventhCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeventhCollectionViewCell", for: indexPath) as? SeventhCollectionViewCell else {return UICollectionViewCell()}
        guard let eighthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EighthCollectionViewCell", for: indexPath) as? EighthCollectionViewCell else {return UICollectionViewCell()}
        guard let ninthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NinthCollectionViewCell", for: indexPath) as? NinthCollectionViewCell else {return UICollectionViewCell()}
        guard let tenthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TenthCollectionViewCell", for: indexPath) as? TenthCollectionViewCell else {return UICollectionViewCell()}
        guard let elvenCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElevenGenreCollectionViewCell", for: indexPath) as? ElevenGenreCollectionViewCell else {return UICollectionViewCell()}
        guard let twelveCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwelveGenreCollectionViewCell", for: indexPath) as? TwelveGenreCollectionViewCell else {return UICollectionViewCell()}
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
            return elvenCell
        case 11:
            return twelveCell
        default:
            return cell
        }
    }
    
}

extension GenreCollectionView :GenreCollectionViewCellDelegate{
    func touchedEyeShadowButton() {
        if let delegate = delegate{delegate.touchedEyeShadowButton()}
    }
    
    
}
// MARK: - method
extension GenreCollectionView {
    func setDelegate() {
        collectionView.dataSource = self
    }
}
