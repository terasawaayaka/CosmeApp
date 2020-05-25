//
//  CreateMakeViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class CreateMakeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CreateMakeMainView!
    //Contstrains
    @IBOutlet weak var mainViewBottomMargin: NSLayoutConstraint!
}
// MARK: - Life cycle
extension CreateMakeViewController {
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
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            mainView.makeImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - Protocol
extension CreateMakeViewController:HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let makePostModel: MakePostModel = MakePostModel()
        if let text = mainView.baseMakeTextView.text {
            makePostModel.basemake = text
        }
        if let text = mainView.highlightTextView.text {
            makePostModel.highlight = text
        }
        if let text = mainView.shadingTextView.text {
            makePostModel.shading = text
        }
        if let text = mainView.eyeshadowTextView.text {
            makePostModel.eyeshadow = text
        }
        if let text = mainView.eyelinerTextView.text {
            makePostModel.eyeliner = text
        }
        if let text = mainView.mascaraTextView.text {
            makePostModel.mascara = text
        }
        if let text = mainView.colorContactTextView.text {
            makePostModel.colorcontact = text
        }
        if let text = mainView.eyebrowTextView.text {
            makePostModel.eyebrow = text
            }
        if let text = mainView.cheekTextView.text {
            makePostModel.cheek = text
        }
        if let text = mainView.lipTextView.text {
            makePostModel.lip = text
        }
        if let text = mainView.skinCareTextView.text {
            makePostModel.skincare = text
        }
        if let text = mainView.hairCareTextView.text {
            makePostModel.haircare = text
        }
        if let text = mainView.processTextView.text {
            makePostModel.process = text
        }
        var images: [UIImage] = []
        if let image = mainView.makeImageView.image {
            images.append(image)
        }
        MakePostModel.create(request: makePostModel, images: images) {
            let timeLineViewController = TimeLineViewController()
            self.navigationController?.pushViewController(timeLineViewController, animated: true)
            self.animatorManager.navigationType = .pop
        }
    }
}
extension CreateMakeViewController:CreateMakeMainViewDelegate {
    func touchedAddImageButton() {
        useCamera()
    }
}
// MARK: - method
extension CreateMakeViewController {
    func setHeaderView() {
        headerView.setLeft(text: "戻る", fontSize: 16, color: UIColor.blue)
        headerView.setCenter(text: "新規メイク画面", fontSize: 19, color: UIColor.black)
        headerView.setRight(text: "シェア", fontSize: 16, color: UIColor.blue)
    }
    func setDelegate() {
        headerView.delegate = self
        mainView.delegate = self
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
        mainViewBottomMargin.constant = keyboardRect.height - tabHeight
        updateView()
    }
    @objc func hideKeyboard(notification: Notification) {
        mainViewBottomMargin.constant = 0
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
