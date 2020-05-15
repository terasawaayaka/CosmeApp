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
}
// MARK: - Life cycle
extension CreateReviewViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension CreateReviewViewController {
}
// MARK: - method
extension CreateReviewViewController {
    func setHeaderView() {
        headerView.setLeft(text: "戻る", fontSize: 16, color: UIColor.blue)
        headerView.setCenter(text: "新規レビュー", fontSize: 19, color: UIColor.black)
        headerView.setRight(text: "シェア", fontSize: 16, color: UIColor.blue)
    }
}
