//
//  CheekSearchViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class CheekSearchViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CheekSearchMainView!
}
// MARK: - Life cycle
extension CheekSearchViewController {
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
extension CheekSearchViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension CheekSearchViewController {
    func setHeaderView(){
        headerView.setLeft(text: "検索画面へ戻る", fontSize: 16, color: #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
    }
}


