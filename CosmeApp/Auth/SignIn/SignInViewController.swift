//
//  SignInViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
// MARK: - Property
class SignInViewController: BaseViewController {

    @IBOutlet weak var mainView: SingInMainView!
    
    //constrans
    @IBOutlet weak var mainViewButtomMargen: NSLayoutConstraint!
}
// MARK: - Life cycle
extension SignInViewController {
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
extension SignInViewController: SingInMainViewDelegate {
    func signInButton() {
        //TimeLineVCへ遷移
        guard let mail = mainView.mailTextField.text else {return}
        guard let password = mainView.passwordTextField.text else {return}
        UserModel.signIn(email: mail, pass: password, failure: { (error) in
            print("SignInエラー",error)
        }) {
            let timelineViewController = TimeLineViewController()
            self.navigationController?.pushViewController(timelineViewController, animated: true)
            self.animatorManager.navigationType = .push
        }
        
    }
    //新規登録はこちら
    func touchedSignUpButton() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
}
// MARK: - method
extension SignInViewController {
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


