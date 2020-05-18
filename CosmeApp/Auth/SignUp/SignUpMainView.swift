//
//  SignUpMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SignUpMainViewDelegate: NSObjectProtocol{
    func signUpButton()
    func touchedSignInButton()
}
extension SignUpMainViewDelegate {
}
// MARK: - Property
class SignUpMainView: BaseView {
    weak var delegate: SignUpMainViewDelegate? = nil
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.signUpButton()
        }
    }
    @IBAction func touchedSignInButton(_ sender: UIButton){
        if let delegate = delegate {
            delegate.touchedSignInButton()
        }
    }
}
// MARK: - Life cycle
extension SignUpMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SignUpMainView {
}
// MARK: - method
extension SignUpMainView {
}

