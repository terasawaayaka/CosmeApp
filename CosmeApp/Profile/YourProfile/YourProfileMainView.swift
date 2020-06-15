//
//  YourProfileMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth

protocol YourProfileMainViewDelegate: NSObjectProtocol{
    func touchedPostButton()
    func touchedGenreButton()
    func followButton()
    func blockButton()
    
    func didSelectItemAt(indexPath: IndexPath)
    func secondDidSelectItemAt(indexPath: IndexPath)
}
extension YourProfileMainViewDelegate {
}
// MARK: - Property
class YourProfileMainView: BaseView {
    weak var delegate: YourProfileMainViewDelegate? = nil
    //Outlet
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userText: UILabel!
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
    @IBAction func followButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.followButton()
        }
    }
    @IBOutlet weak var followButton: UIButton!
    @IBAction func blockButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.blockButton()}
    }
    
    @IBOutlet weak var blockButton: UIButton!
    
    
    var isFollowButtonTouched: Bool = false
    var isBlockButtonTouched:Bool = false
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    var makePostModels: [MakePostModel] = [MakePostModel]()
    var userModel: UserModel = UserModel()
}
// MARK: - Life cycle
extension YourProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        getModel(userModel: userModel)
        setDelegate()
        
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: yourTodayCollectionView.frame.width, height: yourTodayCollectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: yourTodayCollectionView, cellName: "YourTodayCollectionViewCell")
    }
}
// MARK: - Protocol
extension YourProfileMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return makePostModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourTodayCollectionViewCell", for: indexPath) as? YourTodayCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCell(makePostModel: makePostModels[indexPath.row])
        return cell
    }
    
}
extension YourProfileMainView :YourScrollMainViewDelegate {
    func didSelectItemAt(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectItemAt(indexPath: indexPath)
        }
    }
}
extension YourProfileMainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.secondDidSelectItemAt(indexPath: indexPath)}
    }
}
// MARK: - method
extension YourProfileMainView {
    func setDelegate() {
        yourTodayCollectionView.dataSource = self
        yourTodayCollectionView.delegate = self
        scrollMainView.delegate = self
    }
    func getModel(userModel: UserModel) {
        if userModel.nickname == "" {
            userName.text =  "名無しさん"
        }else{
            userName.text = userModel.nickname
        }
        
        if userModel.description == "" {
            userText.text = "自己紹介文を入力"
        }else{
            userText.text = userModel.description
        }
        
        if let photo_path = userModel.photo_path {
            if let url = URL(string: photo_path) {
                userIcon.af_setImage(withURL: url)
            }
        }
    }
    func updateFollow() {
        if isFollowButtonTouched {
            followButton.setTitle("フォロー中", for: .normal)
            followButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            followButton.backgroundColor = #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1)
           
        } else {
            followButton.setTitle("フォローする", for: .normal)
            followButton.setTitleColor(#colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1), for: .normal)
            followButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func updateBlock() {
        if isBlockButtonTouched {
            blockButton.setTitle("ブロック中", for: .normal)
            blockButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            blockButton.backgroundColor = #colorLiteral(red: 0.5429320177, green: 0.6178396012, blue: 1, alpha: 1)
           
        } else {
            blockButton.setTitle("ブロックする", for: .normal)
            blockButton.setTitleColor(#colorLiteral(red: 0.5429320177, green: 0.6178396012, blue: 1, alpha: 1), for: .normal)
            blockButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func getModelforCell(filterdReviewPostModels: [ReviewPostModel],userModel: UserModel){
        scrollMainView.getModel(filterdReviewPostModels: reviewPostModels,userModel: userModel)
    }
    func getTodayModel(makePostModels: [MakePostModel]) {
        self.makePostModels = makePostModels
        yourTodayCollectionView.reloadData()
    }
}
