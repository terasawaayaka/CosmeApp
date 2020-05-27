//
//  MyProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class MyProfileViewController: BaseViewController{
    //data
    var userModel: UserModel = UserModel()
    var makePostmodel: MakePostModel = MakePostModel()
    
    //Outlet
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
        if Auth.auth().currentUser == nil {
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
        getModel()
    }
}
// MARK: - Protocol
extension MyProfileViewController :MyProfileMainViewDelegate{
    func editProfileButton() {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.userModel = userModel
        editProfileViewController.modalPresentationStyle = .fullScreen
        present(editProfileViewController, animated: true, completion: nil)
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
    func getModel() {
        UserModel.readMe { (userModel) in
            if let icon = userModel.photo_path {
                self.makePostmodel.post_user_icon = icon
            }
            self.mainView.getModel(userModel: userModel)
            self.userModel = userModel
        }
    }
}
