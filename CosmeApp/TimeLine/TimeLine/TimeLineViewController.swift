//
//  TimeLineViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class TimeLineViewController: BaseViewController {
    @IBOutlet weak var mainView: TimeLineMainView!
}
// MARK: - Life cycle
extension TimeLineViewController {
    override func loadView() {
        super.loadView()
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
extension TimeLineViewController :TimeLineMainViewDelegate{
    func touchedIconViewButton() {
        //TODO : 自分か他人のprofile画面に遷移
    }
    
    func didSelectCollectionViewCell() {
        let makeDetailViewController = MakeDetailViewController()
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func didSelectRowAt() {
        let reviewDetailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
}
// MARK: - method
extension TimeLineViewController {
    func setDelegate(){
        mainView.delegate = self
    }
}
