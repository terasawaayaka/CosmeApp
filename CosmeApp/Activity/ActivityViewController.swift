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
    
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
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
        reviewDetailViewController.reviewPostModel = reviewPostModels[0]
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
        ReviewPostModel.reads { (reviewPostModels) in
            self.reviewPostModels = reviewPostModels
            self.mainView.getModel(reviewPostModels: reviewPostModels)
        }
    }
}
