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
    
    func didSelectItemAt(indexPath: IndexPath)
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
    
    //data
    var makePostModels: [MakePostModel] = [MakePostModel]()
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
// MARK: - method
extension MyProfileMainView {
    func setDelegate() {
        todayCollectionView.dataSource = self
        todayCollectionView.delegate = self
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
    }
    func getMakeModel(makePostModels: [MakePostModel]) {
        self.makePostModels = makePostModels
        todayCollectionView.reloadData()
    }
}
