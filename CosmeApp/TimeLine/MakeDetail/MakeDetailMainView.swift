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
