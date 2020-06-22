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
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
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
}
extension ReportDoneViewController: ReportDoneMainViewDelegate {
    func reportButton() {
        let alert: UIAlertController = UIAlertController(title: "通報しました", message: "", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
            let index = self.navigationController!.viewControllers.count - 4
            self.navigationController?.popToViewController(self.navigationController!.viewControllers[index], animated: true)
        })
        if let text = self.mainView.textView.text {
            self.reviewPostModel.reportText.append(text) }
        reviewPostModel.review_num = +1
        ReviewPostModel.update(request: reviewPostModel) {
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

// MARK: - method
extension ReportDoneViewController {
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func setHeaderView(){
        headerView.setLeft(text: "戻る", fontSize: 16, color: #colorLiteral(red: 0.6392156863, green: 0.3450980392, blue: 1, alpha: 1))
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


