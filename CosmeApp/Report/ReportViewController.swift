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
    
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
}
// MARK: - Life cycle
extension ReportViewController {
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
extension ReportViewController: ReportMainViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let reportDoneViewController = ReportDoneViewController()
            reportDoneViewController.reportMessege = ReportMessege.spam
            reportDoneViewController.reviewPostModel = reviewPostModel
            navigationController?.pushViewController(reportDoneViewController, animated: true)
            animatorManager.navigationType = .slide_push
        case 1:
            let reportDoneViewController = ReportDoneViewController()
            reportDoneViewController.reportMessege = ReportMessege.Sensitive
            reportDoneViewController.reviewPostModel = reviewPostModel
            navigationController?.pushViewController(reportDoneViewController, animated: true)
            animatorManager.navigationType = .slide_push
        case 2:
            let reportDoneViewController = ReportDoneViewController()
            reportDoneViewController.reportMessege = ReportMessege.Aggressive
            reportDoneViewController.reviewPostModel = reviewPostModel
            navigationController?.pushViewController(reportDoneViewController, animated: true)
            animatorManager.navigationType = .slide_push
        case 3:
            let reportDoneViewController = ReportDoneViewController()
            reportDoneViewController.reportMessege = ReportMessege.Suicide
            reportDoneViewController.reviewPostModel = reviewPostModel
            navigationController?.pushViewController(reportDoneViewController, animated: true)
            animatorManager.navigationType = .slide_push
        
        default:
            let reportDoneViewController = ReportDoneViewController()
            reportDoneViewController.reviewPostModel = reviewPostModel
            navigationController?.pushViewController(reportDoneViewController, animated: true)
            animatorManager.navigationType = .slide_push
        }
        
    }
}
extension ReportViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - method
extension ReportViewController {
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize:16 , color: #colorLiteral(red: 0.8397446066, green: 0.3103108182, blue: 0.5394304367, alpha: 1))
    }
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
}


