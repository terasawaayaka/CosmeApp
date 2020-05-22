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
    
    @IBOutlet weak var baseMakeTextView: UITextView! //ベースメイク
    @IBOutlet weak var highlightTextView: UITextView! //ハイライト
    @IBOutlet weak var shadingTextView: UITextView! //シェーディング
    @IBOutlet weak var eyeshadowTextView: UITextView! //アイシャドウ
    @IBOutlet weak var eyelinerTextView: UITextView! //アイライナー
    @IBOutlet weak var mascaraTextView: UITextView! //マスカラ
    @IBOutlet weak var colorContactTextView: UITextView! //カラコン
    @IBOutlet weak var eyebrowTextView: UITextView! //アイブロウ
    @IBOutlet weak var cheekTextView: UITextView! //チーク
    @IBOutlet weak var lipTextView: UITextView! //リップ
    @IBOutlet weak var skinCareTextView: UITextView! //スキンケア
    @IBOutlet weak var hairCareTextView: UITextView! //ヘアケア
    
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
