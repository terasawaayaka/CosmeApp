//
//  ActivityViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class ActivityViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ActivityMainView!
    
    var noticeModel: NoticeModel = NoticeModel()
    var noticeModels: [NoticeModel] = [NoticeModel]()
}
// MARK: - Life cycle
extension ActivityViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getModel()
    }
}
// MARK: - Protocol
extension ActivityViewController:ActivityMainViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
    }
    
    func deleteCell(indexPath: IndexPath) {
        NoticeModel.delete(id: noticeModels[indexPath.row].id) {
        }
    }
 
    func touchedProfilePageButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.userModel.id = noticeModels[indexPath.row].notice_user_id
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedPostPageButton(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[indexPath.row]
        reviewDetailViewController.reviewPostModel.id = noticeModels[indexPath.row].post_id
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondProfileButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.userModel.id = noticeModels[indexPath.row].notice_user_id
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondPostPageButton(indexPath: IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[indexPath.row]
        reviewDetailViewController.reviewPostModel.id = noticeModels[indexPath.row].post_id
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedThirdProfileButton(indexPath: IndexPath) {
        let yourProfileViewController = YourProfileViewController()
        yourProfileViewController.noticeModel = noticeModels[indexPath.row]
        yourProfileViewController.fromPost = true
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}

//全削除ボタン
extension ActivityViewController: HeaderViewDelegate {
    func touchedRightButton(_ sender: UIButton) {
        for noticeModel in noticeModels {
            if let uid = Auth.auth().currentUser?.uid {
                if noticeModel.notice_my_id == uid {
                    //アラート生成
                    //UIAlertControllerのスタイルがalert
                    let alert: UIAlertController = UIAlertController(title: "", message:  "通知を全削除しますか？", preferredStyle:  UIAlertController.Style.alert)
                    // 確定ボタンの処理
                    let confirmAction: UIAlertAction = UIAlertAction(title: "全削除", style: UIAlertAction.Style.default, handler:{
                        // 確定ボタンが押された時の処理をクロージャ実装する
                        (action: UIAlertAction!) -> Void in
                        //実際の処理
                        NoticeModel.delete(id: noticeModel.id) {
                            self.dismiss(animated: true, completion: nil)
                            
                        }
                    })
                    // キャンセルボタンの処理
                    let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                        // キャンセルボタンが押された時の処理をクロージャ実装する
                        (action: UIAlertAction!) -> Void in
                        //実際の処理
                        print("キャンセル")
                    })
                    
                    //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
                    alert.addAction(cancelAction)
                    alert.addAction(confirmAction)
                    
                    //実際にAlertを表示する
                    present(alert, animated: true, completion: nil)
                    
                    
                    
                }
            }
        }
    }
}

// MARK: - method
extension ActivityViewController {
    func setHeaderView() {
        headerView.setCenter(text: "- activity -", fontSize: 20, color: UIColor.black)
        headerView.setRight(text: "全削除", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
        headerView.setLeft(text: "")
    }
    func setDelegate() {
        mainView.delegate = self
        headerView.delegate = self
    }
    func getModel() {
        NoticeModel.reads { (noticeModels) in
            let noticefilters = noticeModels.filter { (noticeModel) -> Bool in
                if let uid = Auth.auth().currentUser?.uid {
                    if noticeModel.notice_my_id == uid {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
            self.noticeModels = noticefilters
            self.mainView.getModel(noticeModels: noticeModels)
            
            for noticeModel in noticeModels {
                if noticeModel.notice_user_id != "" {
                    UserModel.readAt(userId: noticeModel.notice_user_id) { (userModel) in
                        if let name = userModel.nickname {
                            noticeModel.notice_user_name = name
                        }
                        if let icon = userModel.photo_path {
                            noticeModel.notice_user_icon = icon
                        }
                        self.mainView.getModel(noticeModels: self.noticeModels)
                    }
                    if noticeModel.post_id != "" {
                        ReviewPostModel.readAt(id: noticeModel.post_id, success: { (reviewPostModel) in
                            if reviewPostModel.image_paths.count != 0 {
                                noticeModel.post_icon = reviewPostModel.image_paths[0]
                            }
                        }) {
                            print("read at reviewPostModel error")
                        }
                    }
                }
            }
        }
    }
    
}
