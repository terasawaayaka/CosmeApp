//
//  SignUpViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class SignUpViewController: BaseViewController {
    @IBOutlet weak var mainView: SignUpMainView!
}
// MARK: - Life cycle
extension SignUpViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        hideKeybord()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
// MARK: - Protocol
extension SignUpViewController:SignUpMainViewDelegate {
    func signUpButton() {
        //TimeLineVCに遷移
        let userModel: UserModel = UserModel()
        userModel.nickname = mainView.userNameTextField.text
        userModel.mail = mainView.mailTextField.text
        userModel.password = mainView.passwordTextField.text
        
        UserModel.create(request: userModel, success: {
            let timelineViewController = TimeLineViewController()
            self.navigationController?.pushViewController(timelineViewController, animated: true)
            self.animatorManager.navigationType = .push
        }, failure: { (error) in
            print("SignUpエラー",error)
        })
        
    }
    //ログインはこちら
    func touchedSignInButton() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
}
// MARK: - method
extension SignUpViewController {
    func setDelegate(){
        mainView.delegate = self
    }
    func hideKeybord() {
         let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
         hideTap.numberOfTapsRequired = 1
         self.view.isUserInteractionEnabled = true
         self.view.addGestureRecognizer(hideTap)
     }
     @objc func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
         self.view.endEditing(true)
     }
}


