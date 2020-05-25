//
//  TimeLineViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class TimeLineViewController: BaseViewController {
    
    @IBOutlet weak var mainView: TimeLineMainView!
    
    var reviewPostModels : [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension TimeLineViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser == nil{
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
        getModel()
    }
}
// MARK: - Protocol
extension TimeLineViewController :TimeLineMainViewDelegate{
    
    func touchedIconViewButton() {
        //TODO : 自分か他人のprofile画面に遷移
    }
    
    func didSelectCollectionViewCell() {
        let makeDetailViewController = MakeDetailViewController()
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func didSelectRowAt(indexPath:IndexPath) {
        let reviewDetailViewController = ReviewDetailViewController()
        reviewDetailViewController.reviewPostModel = reviewPostModels[indexPath.row]
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension TimeLineViewController {
    func setDelegate(){
        mainView.delegate = self
    }
    func getModel(){
        ReviewPostModel.reads { (reviewPostModels) in
            self.mainView.getModel(reviewPostModels: reviewPostModels)
            self.reviewPostModels = reviewPostModels
        }
    }
}
