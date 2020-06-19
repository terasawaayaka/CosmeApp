//
//  MakeDetailViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth

// MARK: - Property
class MakeDetailViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: MakeDetailMainView!
    
    var makePostModel : MakePostModel = MakePostModel()
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    var userModel: UserModel = UserModel()
    
    var fromProfile: Bool = false
    
}
// MARK: - Life cycle
extension MakeDetailViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeGetModel()
        makeUpdateView()
    }
}
    
// MARK: - Protocol
extension MakeDetailViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        if fromProfile {
            //プロフィールから戻るとき
            animatorManager.navigationType = .pop
        } else {
            //それ以外
            animatorManager.navigationType = .slide_pop
        }
        
    }
    func touchedRightButton(_ sender: UIButton) {
        let editMakeViewController = EditMakeViewController()
        editMakeViewController.makePostModel = makePostModel
        editMakeViewController.modalPresentationStyle = .fullScreen
        present(editMakeViewController, animated: true, completion: nil)
    }
}

extension MakeDetailViewController:MakeDetailMainViewDelegate{
    func iconViewButton(makePostModel: MakePostModel) {
        if let uid = Auth.auth().currentUser?.uid {
                if makePostModel.post_user_id == uid {
                    let myProfileViewController = MyProfileViewController()
                    myProfileViewController.fromPost = true
                    navigationController?.pushViewController(myProfileViewController, animated: true)
                    animatorManager.navigationType = .slide_push
                }else{
                    let yourPlofileViewController = YourProfileViewController()
                    yourPlofileViewController.makePostModel = makePostModel
                    yourPlofileViewController.fromPost = true
                    navigationController?.pushViewController(yourPlofileViewController, animated: true)
                    animatorManager.navigationType = .slide_push
                }
            }
        }
}
// MARK: - method
extension MakeDetailViewController {
    func setHeaderView(){
        if fromProfile {
            //プロフィールから戻るとき
            headerView.setLeft(text: "閉じる", fontSize: 16, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        } else {
            //それ以外
            headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }
        
        headerView.setCenter(text: "メイク詳細", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        if let uid = Auth.auth().currentUser?.uid {
            if makePostModel.post_user_id == uid {
                headerView.setRight(text: "編集", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
            }
        }
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func makeGetModel(){
        MakePostModel.readAt(id: makePostModel.id, success: { (makePostModel) in
            UserModel.readAt(userId: makePostModel.post_user_id) { (userModel) in
                if let name = userModel.nickname {
                    makePostModel.post_user_name = name }
                if let icon = userModel.photo_path{
                    makePostModel.post_user_icon = icon }
                self.makePostModel = makePostModel
                self.mainView.makeGetModel(makePostModel: makePostModel, userModel: userModel)
            }
            self.makePostModel = makePostModel
            self.mainView.makeGetModel(makePostModel: makePostModel, userModel: self.userModel)
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
    func makeUpdateView(){
        mainView.basemakeLabel.text = "ベースメイク：" + makePostModel.basemake
        if makePostModel.basemake != "" {
            mainView.basemakeLabel.isHidden = false
        } else {
            mainView.basemakeLabel.isHidden = true
            mainView.baseHeight.constant = 0
        }
        mainView.shadingLabel.text = "シェーディング：" + makePostModel.shading
        if makePostModel.shading != ""{
            mainView.shadingLabel.isHidden = false
        } else {
            mainView.shadingLabel.isHidden = true
            mainView.shadingHeight.constant = 0
        }
        mainView.highlightLabel.text = "ハイライト：" + makePostModel.highlight
        if makePostModel.highlight != ""{
            mainView.highlightLabel.isHidden = false
        } else {
            mainView.highlightLabel.isHidden = true
            mainView.hiLightHeight.constant = 0
        }
        mainView.cheekLabel.text = "チーク：" + makePostModel.cheek
        if makePostModel.cheek != ""{
            mainView.cheekLabel.isHidden = false
        } else {
            mainView.cheekLabel.isHidden = true
            mainView.cheekHeight.constant = 0
        }
        mainView.eyeshadowLabel.text = "アイシャドウ：" + makePostModel.eyeshadow
        if makePostModel.eyeshadow != ""{
            mainView.eyeshadowLabel.isHidden = false
        } else {
            mainView.eyeshadowLabel.isHidden = true
            mainView.eyeshadowHeight.constant = 0
        }
        mainView.eyelinerLabel.text = "アイライン：" + makePostModel.eyeliner
        if makePostModel.eyeliner != ""{
            mainView.eyelinerLabel.isHidden = false
        } else {
            mainView.eyelinerLabel.isHidden = true
            mainView.eyeLinerHeight.constant = 0
        }
        mainView.mascaraLabel.text = "マスカラ：" + makePostModel.mascara
        if makePostModel.mascara != ""{
            mainView.mascaraLabel.isHidden = false
        } else {
            mainView.mascaraLabel.isHidden = true
            mainView.mascaraHeight.constant = 0
        }
        mainView.colorcontactLabel.text = "カラコン：" + makePostModel.colorcontact
        if makePostModel.colorcontact != ""{
            mainView.colorcontactLabel.isHidden = false
        } else {
            mainView.colorcontactLabel.isHidden = true
            mainView.colorconHeight.constant = 0
        }
        mainView.eyeblowLabel.text = "アイブロウ：" + makePostModel.eyebrow
        if makePostModel.eyebrow != ""{
            mainView.eyeblowLabel.isHidden = false
        } else {
            mainView.eyeblowLabel.isHidden = true
            mainView.eyeBrowHeight.constant = 0
        }
        mainView.lipLabel.text = "リップ：" + makePostModel.lip
        if makePostModel.lip != ""{
            mainView.lipLabel.isHidden = false
        } else {
            mainView.lipLabel.isHidden = true
            mainView.lipHeight.constant = 0
        }
        mainView.haircareLabel.text = "ヘアケア：" + makePostModel.haircare
        if makePostModel.haircare != "" {
            mainView.haircareLabel.isHidden = false
        } else {
            mainView.haircareLabel.isHidden = true
            mainView.haircareHeight.constant = 0
        }
        mainView.skincareLabel.text = "スキンケア：" + makePostModel.skincare
        if makePostModel.skincare != "" {
            mainView.skincareLabel.isHidden = false
        } else {
            mainView.skincareLabel.isHidden = true
            mainView.skincareHeight.constant = 0
        }
        
        mainView.processTextView.text = makePostModel.process
        switch makePostModel.image_paths.count {
        case 0:
            mainView.makeImage.image = UIImage(named: "noimage.png")
            
        case 1:
            if let url = URL(string: makePostModel.image_paths[0]){
                mainView.makeImage.af_setImage(withURL: url)
            }
        default:
            break
        }
        if makePostModel.post_user_name == ""{
            mainView.userName.text = "メンバーがいません"
        }else{
            mainView.userName.text = makePostModel.post_user_name
        }
        if let photo_path = makePostModel.post_user_icon{
            if let url = URL(string: photo_path){
                mainView.iconView.af_setImage(for: .normal, url: url)
            }
        }
    }
}

