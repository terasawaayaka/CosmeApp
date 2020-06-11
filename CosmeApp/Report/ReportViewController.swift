//
//  ReportViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/10.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class ReportViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ReportMainView!
}
// MARK: - Life cycle
extension ReportViewController {
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
extension ReportViewController {
}
// MARK: - method
extension ReportViewController {
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize:16 , color: #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1))
    }
}


