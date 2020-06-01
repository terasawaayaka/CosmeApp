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
                    navigationController?.pushViewController(myProfileViewController, animated: true)
                    animatorManager.navigationType = .slide_push
                }else{
                    let yourPlofileViewController = YourProfileViewController()
                    yourPlofileViewController.makePostModel = makePostModel
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
            headerView.setLeft(text: "閉じる", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        } else {
            //それ以外
            headerView.setLeft(text: "＜", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }
        
        headerView.setCenter(text: "メイク詳細", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        if let uid = Auth.auth().currentUser?.uid {
            if makePostModel.post_user_id == uid {
                headerView.setRight(text: "編集", fontSize: 18, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
            }
        }
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func makeGetModel(){
        MakePostModel.readAt(id: makePostModel.id, success: { (makePostModel) in
            self.makePostModel = makePostModel
        }) {
            self.navigationController?.popViewController(animated: true)
            self.animatorManager.navigationType = .slide_pop
        }
    }
    func makeUpdateView(){
        mainView.basemakeLabel.text = "ベースメイク：" + makePostModel.basemake
        mainView.shadingLabel.text = "シェーディング：" + makePostModel.shading
        mainView.highlightLabel.text = "ハイライト：" + makePostModel.highlight
        mainView.cheekLabel.text = "チーク：" + makePostModel.cheek
        mainView.eyeshadowLabel.text = "アイシャドウ：" + makePostModel.eyeshadow
        mainView.eyelinerLabel.text = "アイライン：" + makePostModel.eyeliner
        mainView.mascaraLabel.text = "マスカラ：" + makePostModel.mascara
        mainView.colorcontactLabel.text = "カラコン：" + makePostModel.colorcontact
        mainView.eyeblowLabel.text = "アイブロウ：" + makePostModel.eyebrow
        mainView.lipLabel.text = "リップ：" + makePostModel.lip
        mainView.haircareLabel.text = "ヘアケア：" + makePostModel.haircare
        mainView.skincareLabel.text = "スキンケア：" + makePostModel.skincare
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

