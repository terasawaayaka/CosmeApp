//
//  EditMakeViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class EditMakeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: EditMakeMainView!
    @IBOutlet weak var mainViewBottomMergin: NSLayoutConstraint!
    
    var makePostModel : MakePostModel = MakePostModel()
    let loadingView: LoadingView = LoadingView()
}
// MARK: - Life cycle
extension EditMakeViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
        hideKeybord()
        showKeyboardObserver(self, selector: #selector(showKeyboard(notification:)))
        hideKeyboardObserver(self, selector: #selector(hideKeyboard(notification:)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeGiveModel()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage]as? UIImage{
            mainView.makeImage.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - Protocol
extension EditMakeViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        if let text = mainView.basemakeTextField.text {
            makePostModel.basemake = text
               }
        if let text = mainView.shadingTextField.text{
            makePostModel.shading = text
        }
        if let text = mainView.highLightTextField.text{
            makePostModel.highlight = text
        }
        if let text = mainView.cheekTextField.text{
            makePostModel.cheek = text
        }
        if let text = mainView.eyeshadowTextField.text{
            makePostModel.eyeshadow = text
        }
        if let text = mainView.eyeLinerTextField.text{
            makePostModel.eyeliner = text
        }
        if let text = mainView.mascaraTextField.text{
            makePostModel.mascara = text
        }
        if let text = mainView.colorcontactTextField.text{
            makePostModel.colorcontact = text
        }
        if let text = mainView.eyebrowTextField.text{
            makePostModel.eyebrow = text
        }
        if let text = mainView.lipTextField.text{
            makePostModel.lip = text
        }
        if let text = mainView.haircareTextField.text{
            makePostModel.haircare = text
        }
        if let text = mainView.skincareTextField.text{
            makePostModel.skincare = text
        }
        if let text = mainView.processTextView.text{
            makePostModel.process = text
        }
        var images : [UIImage] = []
        if let image = mainView.makeImage.image{
            images.append(image)
        }
        
        addLoadingView()
        MakePostModel.update(request: makePostModel, images: images) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension EditMakeViewController:EditMakeMainViewDelegate{
    func postDeleteButton() {
        //アラート生成
        //UIAlertControllerのスタイルがalert
        let alert: UIAlertController = UIAlertController(title: "", message:  "投稿を削除しますか？", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction: UIAlertAction = UIAlertAction(title: "削除", style: UIAlertAction.Style.default, handler:{
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //実際の処理
            MakePostModel.delete(id: self.makePostModel.id) {
                self.dismiss(animated: true, completion: nil)
            }
        })
        // キャンセルボタンの処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            // キャンセルボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //実際の処理
            print("キャンセル")
            
        })
        
        //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        //実際にAlertを表示する
        present(alert, animated: true, completion: nil)
        
    }
    
    func addMakeImageButton() {
        useCamera()
    }
    
    
}

// MARK: - method
extension EditMakeViewController {
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize: 16, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "メイク編集", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func makeGiveModel(){
        mainView.updateMake(makePostModel:makePostModel)
    }
    
    func addLoadingView() {
        loadingView.frame = self.view.frame
        self.view.addSubview(loadingView)
    }
    func removeLoadingView() {
        loadingView.removeFromSuperview()
    }
    
    
    //キーボードとテキストフィールド以外をタップでキーボードを隠す
    func hideKeybord() {
        let hideTap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKyeoboardTap))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    @objc func hideKyeoboardTap(recognizer : UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @objc func showKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var tabHeight: CGFloat = 0.0
        if let tabBarController = tabBarController {
            tabHeight = tabBarController.tabBar.frame.height
        }
        mainViewBottomMergin.constant = keyboardRect.height - tabHeight
        updateView()
    }
    @objc func hideKeyboard(notification: Notification) {
        mainViewBottomMergin.constant = 0
        updateView()
    }
    func updateView() {
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.view.updateConstraints()
        }
    }
    func showKeyboardObserver(_ observer: Any, selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer,
                                               selector: aSelector,
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    func hideKeyboardObserver(_ observer: Any,
                              selector aSelector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func removeShowKeyboardObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
    }
    func removeHideKeyboardObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
}


