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
    @IBOutlet weak var foundationTextField: UITextField! //ファンデーション
    @IBOutlet weak var highlightTextField: UITextField! //ハイライト
    @IBOutlet weak var shadingTextField: UITextField! //シェーディング
    @IBOutlet weak var eyeshadowTextField: UITextField! //アイシャドウ
    @IBOutlet weak var eyelinerTextField: UITextField! //アイライナー
    @IBOutlet weak var mascaraTextField: UITextField! //マスカラ
    @IBOutlet weak var colorContactTextField: UITextField! //カラコン
    @IBOutlet weak var eyebrowTextField: UITextField! //アイブロウ
    @IBOutlet weak var cheekTextField: UITextField! //チーク
    @IBOutlet weak var lipTextField: UITextField! //リップ
    
    @IBOutlet weak var processTextField: UITextView! //プロセス
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
