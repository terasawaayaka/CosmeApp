//
//  NewPostViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class NewPostViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    
    @IBOutlet weak var mainView: NewPostMainView!
}
// MARK: - Life cycle
extension NewPostViewController {
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
extension NewPostViewController:NewPostMainViewDelegate {
    func touchedReviewButton() {
        let createReviewController = CreateReviewViewController()
        navigationController?.pushViewController(createReviewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    func touchedMakeButton() {
        let createMakeViewController = CreateMakeViewController()
        navigationController?.pushViewController(createMakeViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension NewPostViewController {
    func setHeaderView() {
        headerView.setCenter(text: "- new post -", fontSize: 19, color: UIColor.black)
        headerView.setLeft(text: "")
    }
    func setDelegate() {
        mainView.delegate = self
    }
}
