//
//  CreateMakeMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol CreateMakeMainViewDelegate: NSObjectProtocol{
    func touchedAddImageButton()
}
extension CreateMakeMainViewDelegate {
}
// MARK: - Property
class CreateMakeMainView: BaseView {
    weak var delegate: CreateMakeMainViewDelegate? = nil
    @IBOutlet weak var makeImageView: UIImageView!
    @IBAction func touchedAddImageButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedAddImageButton()
        }
    }
    

    @IBOutlet weak var baseMakeTextField: UITextField!
    @IBOutlet weak var shadingTextField: UITextField!
    @IBOutlet weak var highlightTextField: UITextField!
    @IBOutlet weak var cheekTextField: UITextField!
    @IBOutlet weak var eyeshadowTextField: UITextField!
    @IBOutlet weak var eyelinerTextField: UITextField!
    @IBOutlet weak var mascaraTextField: UITextField!
    @IBOutlet weak var colorContactTextField: UITextField!
    @IBOutlet weak var eyebrowTextField: UITextField!
    @IBOutlet weak var lipTextField: UITextField!
    @IBOutlet weak var hairCareTextField: UITextField!
    @IBOutlet weak var skinCareTextField: UITextField!
    
    
    @IBOutlet weak var processTextView: UITextView! //プロセス
}
// MARK: - Life cycle
extension CreateMakeMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension CreateMakeMainView {
}

// MARK: - method
extension CreateMakeMainView {
}
