//
//  ReportDoneViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/12.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework

enum ReportMessege {
    case spam
    case Sensitive
    case Aggressive
    case Suicide
}

// MARK: - Property
class ReportDoneViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: ReportDoneMainView!
    
    var reportMessege: ReportMessege = ReportMessege.spam
    @IBOutlet weak var reportedViewHeight: NSLayoutConstraint!
    
    
}
// MARK: - Life cycle
extension ReportDoneViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
        changeLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension ReportDoneViewController: HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    func touchedRightButton(_ sender: UIButton) {
        let index = navigationController!.viewControllers.count - 4
        navigationController?.popToViewController(navigationController!.viewControllers[index], animated: true)
    }
}
extension ReportDoneViewController: ReportDoneMainViewDelegate {
    func reportButton() {
        let alert: UIAlertController = UIAlertController(title: "通報しました", message: "", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)

        present(alert, animated: true, completion: nil)
    }
}
// MARK: - method
extension ReportDoneViewController {
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func setHeaderView(){
        headerView.setLeft(text: "戻る", fontSize: 16, color: #colorLiteral(red: 0.7116513325, green: 0.1774580224, blue: 0.3965806173, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 16, color: #colorLiteral(red: 0.7116513325, green: 0.1774580224, blue: 0.3965806173, alpha: 1))
    }
    func changeLabel(){
        switch reportMessege {
        case .spam:
            mainView.reportLabel.text = "内容がスパムである"
        case .Sensitive:
            mainView.reportLabel.text = "センシティブな画像\nまたは動画を表示している"
        case .Aggressive:
            mainView.reportLabel.text = "不適切または攻撃的な\n内容を含んでいる"
        case .Suicide:
            mainView.reportLabel.text = "自傷行為や自殺を\nほのめかしている"
        default:
            mainView.reportLabel.text = ""
        }
    }
}


