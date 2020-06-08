//
//  SearchUserSelectResultViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/22.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class SearchUserSelectResultViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var yourProfileView: YourProfileMainView!
    var userModel: UserModel = UserModel()
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension SearchUserSelectResultViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getReviewPostModel()
        giveModel()
    }
}
// MARK: - Protocol
extension SearchUserSelectResultViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
// MARK: - method
extension SearchUserSelectResultViewController {
    func setHeaderView(){
        headerView.setLeft(text: "検索画面へ戻る", fontSize: 16, color: #colorLiteral(red: 0.7116513325, green: 0.1774580224, blue: 0.3965806173, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
    }
    func getReviewPostModel(){
        ReviewPostModel.reads { (reviewPostModels) in
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.post_user_id == self.userModel.id {
                    return true
                }else {
                    return false
                }
            }
            self.reviewPostModels = filterdReviewPostModels
            self.yourProfileView.reviewPostModels = filterdReviewPostModels
            self.yourProfileView.getModelforCell(filterdReviewPostModels: reviewPostModels, userModel: self.userModel)
        }
    }
    func giveModel(){
        yourProfileView.getModel(userModel: userModel)
        
    }
}


