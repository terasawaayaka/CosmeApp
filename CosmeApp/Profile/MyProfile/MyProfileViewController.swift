//
//  MyProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class MyProfileViewController: BaseViewController{
    @IBOutlet weak var mainView: MyProfileMainView!
}
// MARK: - Life cycle
extension MyProfileViewController {
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
extension MyProfileViewController :MyProfileMainViewDelegate{
    func editProfileButton() {
        let editProfileViewController = YourProfileViewController()
        navigationController?.pushViewController(editProfileViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    func touchedGoodButton() {
        let firstPoint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPoint, animated: true)
    }
    
    func touchedBookMarkButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
    }
    
    func touchedGenreButton() {
        let thirdPoint = CGPoint(x: mainView.frame.width * 2, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(thirdPoint, animated: true)
    }
}

// MARK: - method
extension MyProfileViewController {
    func setDelegate(){
        mainView.delegate = self
    }
}
