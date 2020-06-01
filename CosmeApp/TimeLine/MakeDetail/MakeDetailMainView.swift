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
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var iconView: UIButton!
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
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
}
