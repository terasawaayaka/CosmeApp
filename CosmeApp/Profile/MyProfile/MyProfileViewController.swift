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
    func didEndScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset == CGPoint(x: 0, y: 0) {
            mainView.scrollBar.isHidden = false
            mainView.secondScrollBar.isHidden = true
        }else {
            mainView.scrollBar.isHidden = true
            mainView.secondScrollBar.isHidden = false
        }
    }
    
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
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        reviewDetailViewController.fromProfile = true
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func didSelectItemAtGenre(indexPath: IndexPath) {
        //ジャンルをタップしたとき
        mainView.scrollMainView.genreCollectionView.isHidden = true
        
        switch indexPath.row {
        case 0:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyeshadow = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "アイシャドウ" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: eyeshadow)
                self.reviewPostModels = eyeshadow
            }
        case 1:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyeliner = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "アイライナー" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: eyeliner)
                self.reviewPostModels = eyeliner
            }
        case 2:
            ReviewPostModel.reads { (reviewPostModels) in
                let mascara = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "マスカラ" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: mascara)
                self.reviewPostModels = mascara
            }
        case 3:
            ReviewPostModel.reads { (reviewPostModels) in
                let colorcontact = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "カラコン" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: colorcontact)
                self.reviewPostModels = colorcontact
            }
        case 4:
            ReviewPostModel.reads { (reviewPostModels) in
                let eyebrow = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "アイブロウ" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: eyebrow)
                self.reviewPostModels = eyebrow
            }
        case 5:
            ReviewPostModel.reads { (reviewPostModels) in
                let basemake = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "ベースメイク" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: basemake)
                self.reviewPostModels = basemake
            }
        case 6:
            ReviewPostModel.reads { (reviewPostModels) in
                let highlight = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "ハイライト" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: highlight)
                self.reviewPostModels = highlight
            }
        case 7:
            ReviewPostModel.reads { (reviewPostModels) in
                let shading = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "シェーディング" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: shading)
                self.reviewPostModels = shading
            }
        case 8:
            ReviewPostModel.reads { (reviewPostModels) in
                let cheek = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "チーク" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: cheek)
                self.reviewPostModels = cheek
            }
        case 9:
            ReviewPostModel.reads { (reviewPostModels) in
                let skincare = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "スキンケア" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: skincare)
                self.reviewPostModels = skincare
            }
        case 10:
            ReviewPostModel.reads { (reviewPostModels) in
                let lip = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: lip)
                self.reviewPostModels = lip
            }
        case 11:
            ReviewPostModel.reads { (reviewPostModels) in
                let haircare = reviewPostModels.filter { (reviewPostModel) -> Bool in
                    if let uid = Auth.auth().currentUser?.uid {
                        if reviewPostModel.post_user_id == uid && reviewPostModel.category == "ヘアケア" {
                        return true
                    } else {
                        return false
                    }
                    } else {
                        return false
                    }
                }
                self.mainView.scrollMainView.searchGenreCollectionView.getModel(reviewPostModels: haircare)
                self.reviewPostModels = haircare
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
        headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7390006781, green: 0.7434574962, blue: 1, alpha: 1))
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
