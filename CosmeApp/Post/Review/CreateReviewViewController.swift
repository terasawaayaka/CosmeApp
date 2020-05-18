//
//  CreateReviewViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class CreateReviewViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CreateReviewMainView!
}
// MARK: - Life cycle
extension CreateReviewViewController {
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
extension CreateReviewViewController:HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let timelineViewController = TimeLineViewController()
        navigationController?.pushViewController(timelineViewController, animated: true)
        animatorManager.navigationType = .pop
    }
}
extension CreateReviewViewController:CreateReviewMainViewDelegate {
    func touchedAddImageButton() {
        //todo
    }
    func firstStarButton() {
        //todo
    }
    func secondStarButton() {
        //todo
    }
    
    func thirdStarButton() {
        //todo
    }
    
    func fourthStarButton() {
        //todo
    }
    
    func fifthStarButton() {
        //todo
    }
}
// MARK: - method
extension CreateReviewViewController {
    func setHeaderView() {
        headerView.setLeft(text: "戻る", fontSize: 16, color: UIColor.blue)
        headerView.setCenter(text: "新規レビュー", fontSize: 19, color: UIColor.black)
        headerView.setRight(text: "シェア", fontSize: 16, color: UIColor.blue)
    }
    func setDelegate() {
        headerView.delegate = self
        mainView.delegate = self
    }
}
