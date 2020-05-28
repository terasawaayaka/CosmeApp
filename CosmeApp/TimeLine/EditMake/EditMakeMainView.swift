//
//  EditMakeMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol EditMakeMainViewDelegate: NSObjectProtocol{
    func postDeleteButton()
    func addMakeImageButton()
    
}
extension EditMakeMainViewDelegate {
}
// MARK: - Property
class EditMakeMainView: BaseView {
    weak var delegate: EditMakeMainViewDelegate? = nil
    
    var makePostModel : MakePostModel = MakePostModel()
    
    @IBOutlet weak var makeImage: UIImageView!
    
    @IBOutlet weak var basemakeTextField: UITextField!
    @IBOutlet weak var shadingTextField: UITextField!
    @IBOutlet weak var highLightTextField: UITextField!
    @IBOutlet weak var cheekTextField: UITextField!
    @IBOutlet weak var eyeshadowTextField: UITextField!
    @IBOutlet weak var eyeLinerTextField: UITextField!
    @IBOutlet weak var mascaraTextField: UITextField!
    @IBOutlet weak var colorcontactTextField: UITextField!
    @IBOutlet weak var eyebrowTextField: UITextField!
    @IBOutlet weak var lipTextField: UITextField!
    @IBOutlet weak var haircareTextField: UITextField!
    @IBOutlet weak var skincareTextField: UITextField!
    @IBOutlet weak var processTextView: UITextView!

    
    @IBAction func postDeleteButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.postDeleteButton()}
    }
    @IBAction func addMakeImageButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.addMakeImageButton()}
    }
}
// MARK: - Life cycle
extension EditMakeMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditMakeMainView {
}
// MARK: - method
extension EditMakeMainView {
    func updateMake(makePostModel:MakePostModel){
        basemakeTextField.text = makePostModel.basemake
        shadingTextField.text = makePostModel.shading
        highLightTextField.text = makePostModel.highlight
        cheekTextField.text = makePostModel.cheek
        eyeshadowTextField.text = makePostModel.eyeshadow
        eyeLinerTextField.text = makePostModel.eyeliner
        mascaraTextField.text = makePostModel.mascara
        colorcontactTextField.text = makePostModel.colorcontact
        eyebrowTextField.text = makePostModel.eyebrow
        lipTextField.text = makePostModel.lip
        haircareTextField.text = makePostModel.haircare
        skincareTextField.text = makePostModel.skincare
        processTextView.text = makePostModel.process
        switch makePostModel.image_paths.count {
            case 0:
                makeImage.image = UIImage(named: "noimage.png")
                
            case 1:
                if let url = URL(string: makePostModel.image_paths[0]){
                    makeImage.af_setImage(withURL: url)
                }
            default:
                break
        }
    }
}
       
