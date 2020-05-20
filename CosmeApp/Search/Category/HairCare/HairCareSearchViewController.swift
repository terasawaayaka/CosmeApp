//
//  HairCareSearchViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class HairCareSearchViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: HairCareMainView!
}
// MARK: - Life cycle
extension HairCareSearchViewController {
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
extension HairCareSearchViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension HairCareSearchViewController {
    func setHeaderView(){
        headerView.setLeft(text: "検索画面へ戻る", fontSize: 16, color: #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
    }
}


