//
//  SingInMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SingInMainViewDelegate: NSObjectProtocol{
    func signInButton()
    func touchedSignUpButton()
}
extension SingInMainViewDelegate {
}
// MARK: - Property
class SingInMainView: BaseView {
    weak var delegate: SingInMainViewDelegate? = nil
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.signInButton()
        }
    }
    @IBAction func touchedSignUpButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSignUpButton()
        }
    }
}
// MARK: - Life cycle
extension SingInMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SingInMainView {
}
// MARK: - method
extension SingInMainView {
}

