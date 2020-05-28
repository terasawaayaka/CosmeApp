//
//  MakeDetailViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class MakeDetailViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: MakeDetailMainView!
    
    var makePostModel : MakePostModel = MakePostModel()
    
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
        makeUpdateView()
    }
}
    
// MARK: - Protocol
extension MakeDetailViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let editMakeViewController = EditMakeViewController()
        editMakeViewController.modalPresentationStyle = .fullScreen
        present(editMakeViewController, animated: true, completion: nil)
    }
}

extension MakeDetailViewController:MakeDetailMainViewDelegate{
    func iconViewButton() {
        //TODO : 自分か他人のprofile画面に遷移
    }
    
    
}
// MARK: - method
extension MakeDetailViewController {
    func setHeaderView(){
        headerView.setLeft(text: "＜", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setCenter(text: "メイク詳細", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "編集", fontSize: 18, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func makeUpdateView(){
        mainView.basemakeLabel.text = makePostModel.basemake
        mainView.shadingLabel.text = makePostModel.shading
        mainView.highlightLabel.text = makePostModel.highlight
        mainView.cheekLabel.text = makePostModel.cheek
        mainView.eyeshadowLabel.text = makePostModel.eyeshadow
        mainView.eyelinerLabel.text = makePostModel.eyeliner
        mainView.mascaraLabel.text = makePostModel.mascara
        mainView.colorcontactLabel.text = makePostModel.colorcontact
        mainView.eyeblowLabel.text = makePostModel.eyebrow
        mainView.lipLabel.text = makePostModel.lip
        mainView.haircareLabel.text = makePostModel.haircare
        mainView.skincareLabel.text = makePostModel.skincare
        mainView.processTextView.text = makePostModel.process
    }
}

