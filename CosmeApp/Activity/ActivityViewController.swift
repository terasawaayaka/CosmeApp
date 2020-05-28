//
//  ActivityViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class ActivityViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ActivityMainView!
    
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
    func touchedProfilePageButton() {
        let yourProfileViewController = YourProfileViewController()
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedPostPageButton() {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[0]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondProfileButton() {
        let yourProfileViewController = YourProfileViewController()
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedSecondPostPageButton() {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.noticeModel = noticeModels[0]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedThirdProfileButton() {
        let yourProfileViewController = YourProfileViewController()
        navigationController?.pushViewController(yourProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension ActivityViewController {
    func setHeaderView() {
        headerView.setCenter(text: "アクティビティ", fontSize: 19, color: UIColor.black)
        headerView.setLeft(text: "")
    }
    func setDelegate() {
        mainView.delegate = self
        
    }
    func getModel() {
        NoticeModel.reads { (noticeModels) in
            self.noticeModels = noticeModels
            self.mainView.getModel(noticeModels: noticeModels)
//            for noticeModel in noticeModels {
//                print("Desc:",noticeModel.description)
//            }
        }
    }
}
