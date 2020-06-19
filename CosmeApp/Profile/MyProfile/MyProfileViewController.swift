//
//  MyProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class MyProfileViewController: BaseViewController{
    //data
    var userModel: UserModel = UserModel()
    var makePostModel: MakePostModel = MakePostModel()
    var makePostModels: [MakePostModel] = [MakePostModel]()
    var noticeModel: NoticeModel = NoticeModel()
    var noticeModels: [NoticeModel] = [NoticeModel]()
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    
    //Outlet
    @IBOutlet weak var mainView: MyProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var fromPost: Bool = false
}
// MARK: - Life cycle
extension MyProfileViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
        mainView.secondScrollBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser == nil {
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
        getModel()
        getModelBookmark()
    }
}
// MARK: - Protocol
extension MyProfileViewController :MyProfileMainViewDelegate{
    func didSelectItemAtBookmark(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        reviewDetailViewController.fromProfile = true
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func touchedFollowButton() {
        let followViewController = FollowViewController()
        navigationController?.pushViewController(followViewController, animated: true)
        followViewController.follow = true
        animatorManager.navigationType = .slide_push
    }
    
    func touchedFollowerButton() {
        let followViewController = FollowViewController()
        navigationController?.pushViewController(followViewController, animated: true)
        followViewController.follower = true
        animatorManager.navigationType = .slide_push
    }
    
    func didSelectItemAtGood(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        makeDetailViewController.fromProfile = true
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func didSelectItemAtSearchGenre(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        makeDetailViewController.fromProfile = true
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func didSelectItemAtGenre(indexPath: IndexPath) {
        //ジャンルをタップしたとき
        mainView.scrollMainView.genreCollectionView.isHidden = true
        
        switch indexPath.row {
        case 0:
            MakePostModel.reads { (makePostModels) in
                let eyeshadow = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.eyeshadow != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: eyeshadow)
                self.makePostModels = eyeshadow
            }
        case 1:
            MakePostModel.reads { (makePostModels) in
                let eyeliner = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.eyeliner != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: eyeliner)
                self.makePostModels = eyeliner
            }
        case 2:
            MakePostModel.reads { (makePostModels) in
                let mascara = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.mascara != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: mascara)
                self.makePostModels = mascara
            }
        case 3:
            MakePostModel.reads { (makePostModels) in
                let colorcontact = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.colorcontact != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: colorcontact)
                self.makePostModels = colorcontact
            }
        case 4:
            MakePostModel.reads { (makePostModels) in
                let eyebrow = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.eyebrow != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: eyebrow)
                self.makePostModels = eyebrow
            }
        case 5:
            MakePostModel.reads { (makePostModels) in
                let basemake = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.basemake != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: basemake)
                self.makePostModels = basemake
            }
        case 6:
            MakePostModel.reads { (makePostModels) in
                let highlight = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.highlight != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: highlight)
                self.makePostModels = highlight
            }
        case 7:
            MakePostModel.reads { (makePostModels) in
                let shading = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.shading != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: shading)
                self.makePostModels = shading
            }
        case 8:
            MakePostModel.reads { (makePostModels) in
                let cheek = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.cheek != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: cheek)
                self.makePostModels = cheek
            }
        case 9:
            MakePostModel.reads { (makePostModels) in
                let skincare = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.skincare != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: skincare)
                self.makePostModels = skincare
            }
        case 10:
            MakePostModel.reads { (makePostModels) in
                let lip = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.lip != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: lip)
                self.makePostModels = lip
            }
        case 11:
            MakePostModel.reads { (makePostModels) in
                let haircare = makePostModels.filter { (makePostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if makePostModel.post_user_id == uid && makePostModel.haircare != "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(makePostModels: haircare)
                self.makePostModels = haircare
            }
        default:
            break
        }
    }
    
    
    func didSelectItemAt(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        makeDetailViewController.fromProfile = true
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func editProfileButton() {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.userModel = userModel
        editProfileViewController.modalPresentationStyle = .fullScreen
        present(editProfileViewController, animated: true, completion: nil)
    }
    
    func touchedGoodButton() {
        let firstPoint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPoint, animated: true)
    }
    
    func touchedBookMarkButton() {
        let secondPoint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
        mainView.scrollBar.isHidden = false
        mainView.secondScrollBar.isHidden = true
    }
    
    func touchedGenreButton() {
        let thirdPoint = CGPoint(x: mainView.frame.width , y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(thirdPoint, animated: true)
        mainView.scrollMainView.genreCollectionView.isHidden = false
        
        mainView.scrollBar.isHidden = true
        mainView.secondScrollBar.isHidden = false
    }
}

extension MyProfileViewController:HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        if fromPost{
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
        }
    }
}

// MARK: - method
extension MyProfileViewController {
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
    
    func setHeaderView(){
        if fromPost{
        headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        headerView.setLeft(text: "戻る", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }else{
            headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            headerView.setLeft(text: "")
        }
    }
    
    func getModel() {
        UserModel.readMe { (userModel) in
            if let icon = userModel.photo_path {
                self.makePostModel.post_user_icon = icon
            }
            self.mainView.getModel(userModel: userModel)
            self.userModel = userModel
        }
        
        MakePostModel.reads { (makePostModels) in
            let filterdMakePostModels = makePostModels.filter { (makePostModel) -> Bool in
                if let uid = Auth.auth().currentUser?.uid {
                    if makePostModel.post_user_id == uid {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
            self.mainView.getMakeModel(makePostModels: filterdMakePostModels)
            self.makePostModels = filterdMakePostModels
        }
        
        NoticeModel.reads { (noticeModels) in
             let goodFilters = noticeModels.filter { (noticeModel) -> Bool in
                 if let uid = Auth.auth().currentUser?.uid {
                     if noticeModel.noticeType == "いいね" && noticeModel.notice_my_id == uid {
                         return true
                         } else {
                         return false
                     }
                 } else {
                     return false
                 }
             }
//             self.mainView.scrollMainView.goodCollectionView.getModel(noticeModels: goodFilters)
             self.noticeModels = goodFilters
         }
    }
    func getModelBookmark() {
    ReviewPostModel.reads { (reviewPostModels) in
        let bookmark = reviewPostModels.filter { (reviewPostModel) -> Bool in
            if let uid = Auth.auth().currentUser?.uid {
                var isFavorite: Bool = false
                reviewPostModel.favorite_users.forEach { (favoriteUser) in
                    favoriteUser.forEach { (key, val) in
                        if key == uid && val == true {
                            isFavorite = true
                        }
                    }
                }
                return isFavorite
            }else {
                return false
            }
        }
        self.mainView.scrollMainView.bookMarkCollectionView.getModel(reviewPostModels: bookmark)
        self.reviewPostModels = bookmark
    }
    }
}
