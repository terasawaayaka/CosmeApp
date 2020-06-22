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
    func editProfileButton()
    func touchedGoodButton()
    func touchedBookMarkButton()
    func touchedGenreButton()
    func touchedFollowButton()
    func touchedFollowerButton()
    
    func didSelectItemAt(indexPath: IndexPath)
    func didSelectItemAtGenre(indexPath: IndexPath)
    func didSelectItemAtSearchGenre(indexPath: IndexPath)
    func didSelectItemAtGood(indexPath: IndexPath)
    func didSelectItemAtBookmark(indexPath: IndexPath)
    func didEndScroll(scrollView: UIScrollView)
}
extension MyProfileMainViewDelegate {
}
// MARK: - Property
class MyProfileMainView: BaseView {
    weak var delegate: MyProfileMainViewDelegate? = nil
    //Outlet
    @IBOutlet weak var scrollBar: UILabel!
    @IBOutlet weak var secondScrollBar: UILabel!
    @IBOutlet weak var followCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowlayout: UICollectionViewFlowLayout!
    @IBOutlet weak var scrollMainView: ScrollMainView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userText: UILabel!
    
    
    //Action
    @IBAction func editProfileButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.editProfileButton()}
    }
    @IBAction func touchedGoodButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedGoodButton()}
    }
    @IBAction func touchedBookMarkButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedBookMarkButton()}
    }
    @IBAction func touchedGenreButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedGenreButton()}
    }
    @IBAction func touchedFollowButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedFollowButton()}
    }
    @IBAction func touchedFollowerButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.touchedFollowerButton()}
    }
    
    //data
    var userModels: [UserModel] = [UserModel]()
    var makePostModels: [MakePostModel] = [MakePostModel]()
    var userModel: UserModel = UserModel()
}
// MARK: - Life cycle
extension MyProfileMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        setLayout()
        
        collectionViewFlowlayout.estimatedItemSize = CGSize(width: todayCollectionView.frame.width, height: todayCollectionView.frame.height)
        loadCollectionViewCellFromXib(collectionView: todayCollectionView, cellName: "TodayCollectionViewCell")
    }
}
//MARK: - Protocol
extension MyProfileMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return makePostModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as? TodayCollectionViewCell else {return UICollectionViewCell()}
        cell.updataCell(makePostModel: makePostModels[indexPath.row])

        return cell
    }
}

extension MyProfileMainView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAt(indexPath: indexPath)}
    }
}
extension MyProfileMainView:ScrollMainViewDelegate{
    func didEndScroll(scrollView: UIScrollView) {
        delegate?.didEndScroll(scrollView: scrollView)
    }
    
    func didSelectItemAtBookmark(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtBookmark(indexPath: indexPath)}
    }
    
    func didSelectItemAtGood(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtGood(indexPath: indexPath)}
    }
    
    func didSelectItemAtSearchGenre(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtSearchGenre(indexPath: indexPath)}
    }
    
    func didSelectItemAtGenre(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtGenre(indexPath: indexPath)}
    }
    

    
}
// MARK: - method
extension MyProfileMainView {
    func setLayout() {
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
    func setDelegate() {
        todayCollectionView.dataSource = self
        todayCollectionView.delegate = self
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
                iconView.af_setImage(withURL: url)
            }
        }
//        var follow : Int = 0
//        followCount.text =
//        follow = userModel.follow_users.count
        
    }
    func getMakeModel(makePostModels: [MakePostModel]) {
        self.makePostModels = makePostModels
        todayCollectionView.reloadData()
    }
}
