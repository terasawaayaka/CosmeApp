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
    }
}
// MARK: - Protocol
extension ActivityViewController:ActivityMainViewDelegate {
    func didSelectRowAt(indexPath:IndexPath) {
        
        func touchedProfilePageButton() {
            let yourProfileViewController = YourProfileViewController()
            navigationController?.pushViewController(yourProfileViewController, animated: true)
            animatorManager.navigationType = .pop
        }
        func touchedPostPageButton() {
            let editReviewViewController = EditReviewViewController()
            navigationController?.pushViewController(editReviewViewController, animated: true)
            animatorManager.navigationType = .pop
        }
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
}
