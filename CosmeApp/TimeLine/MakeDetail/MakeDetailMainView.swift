//
//  MakeDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol MakeDetailMainViewDelegate: NSObjectProtocol{
    func iconViewButton(makePostModel:MakePostModel)
}
extension MakeDetailMainViewDelegate {
}
// MARK: - Property
class MakeDetailMainView: BaseView {
    weak var delegate: MakeDetailMainViewDelegate? = nil
    
    var makePostModel : MakePostModel = MakePostModel()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var iconView: UIButton!
    
    //ラベルの高さ
  
    @IBOutlet weak var mascaraHeight: NSLayoutConstraint!
    @IBOutlet weak var hiLightHeight: NSLayoutConstraint!
    @IBOutlet weak var eyeBrowHeight: NSLayoutConstraint!
    @IBOutlet weak var lipHeight: NSLayoutConstraint!
    @IBOutlet weak var skincareHeight: NSLayoutConstraint!
    @IBOutlet weak var haircareHeight: NSLayoutConstraint!
    @IBOutlet weak var cheekHeight: NSLayoutConstraint!
    @IBOutlet weak var shadingHeight: NSLayoutConstraint!
    @IBOutlet weak var eyeshadowHeight: NSLayoutConstraint!
    @IBOutlet weak var colorconHeight: NSLayoutConstraint!
    @IBOutlet weak var baseHeight: NSLayoutConstraint!
    @IBOutlet weak var eyeLinerHeight: NSLayoutConstraint!
    
    
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.iconViewButton(makePostModel: makePostModel)
        }
    }
    
    //テキストと写真
    @IBOutlet weak var makeImage: UIImageView!
    @IBOutlet weak var basemakeLabel: UILabel!
    @IBOutlet weak var shadingLabel: UILabel!
    @IBOutlet weak var highlightLabel: UILabel!
    @IBOutlet weak var cheekLabel: UILabel!
    @IBOutlet weak var eyeshadowLabel: UILabel!
    @IBOutlet weak var eyelinerLabel: UILabel!
    @IBOutlet weak var mascaraLabel: UILabel!
    @IBOutlet weak var colorcontactLabel: UILabel!
    @IBOutlet weak var eyeblowLabel: UILabel!
    @IBOutlet weak var lipLabel: UILabel!
    @IBOutlet weak var haircareLabel: UILabel!
    @IBOutlet weak var skincareLabel: UILabel!
    @IBOutlet weak var processTextView: UITextView!
    
    
    //テキストの下のボーダー
    @IBOutlet weak var basemakeBoder: UIView!
    @IBOutlet weak var shadingBoder: UIView!
    @IBOutlet weak var highlightBoder: UIView!
    @IBOutlet weak var cheekBoder: UIView!
    @IBOutlet weak var eyeshadowBoder: UIView!
    @IBOutlet weak var eyelineBoder: UIView!
    @IBOutlet weak var mascaraBoder: UIView!
    @IBOutlet weak var colorcontactBoder: UIView!
    @IBOutlet weak var eyebrowBoder: UIView!
    @IBOutlet weak var lipBoder: UIView!
    @IBOutlet weak var haircareBoder: UIView!
    @IBOutlet weak var skincareBoder: UIView!
    
    //マージン
    @IBOutlet weak var shadingMergin: NSLayoutConstraint!
    @IBOutlet weak var highlightMergin: NSLayoutConstraint!
    @IBOutlet weak var cheekMergin: NSLayoutConstraint!
    @IBOutlet weak var eyeshadowMergin: NSLayoutConstraint!
    @IBOutlet weak var eyelineMergin: NSLayoutConstraint!
    @IBOutlet weak var mascaraMergin: NSLayoutConstraint!
    @IBOutlet weak var colorcontactMergin: NSLayoutConstraint!
    @IBOutlet weak var eyebrowMergin: NSLayoutConstraint!
    @IBOutlet weak var lipMergin: NSLayoutConstraint!
    @IBOutlet weak var haircareMergin: NSLayoutConstraint!
    @IBOutlet weak var skincareMergin: NSLayoutConstraint!
    
    
    
}
// MARK: - Life cycle
extension MakeDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension MakeDetailMainView {
}
// MARK: - method
extension MakeDetailMainView {
    func setLayout(){
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = iconView.frame.width / 2
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    func makeGetModel(makePostModel:MakePostModel, userModel: UserModel){
        self.makePostModel = makePostModel
        
        if userModel.nickname == "" {
            userName.text =  "名無しさん"
        }else{
            userName.text = userModel.nickname
        }
        if let photo_path = userModel.photo_path {
            if let url = URL(string: photo_path) {
                imageView.af_setImage(withURL: url)
            }
        }
    }
}
