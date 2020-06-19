//
//  CreateMakeViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth

// MARK: - Property
class CreateMakeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CreateMakeMainView!
    //Contstrains
    @IBOutlet weak var mainViewBottomMargin: NSLayoutConstraint!
    
    let loadingView: LoadingView = LoadingView()
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
        
        if let uid = Auth.auth().currentUser?.uid {
            makePostModel.post_user_id = uid
        }
        
        addLoadingView()
        
        MakePostModel.create(request: makePostModel, images: images) {
            self.tabBarController?.selectedIndex = 0 //タブの切り替え
            let timeLineViewController = TimeLineViewController()
            self.navigationController?.pushViewController(timeLineViewController, animated: true)
            self.animatorManager.navigationType = .pop
            let newPostViewController = NewPostViewController()
            self.navigationController?.pushViewController(newPostViewController, animated: true)
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
        headerView.setLeft(text: "＜", fontSize: 16, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "- new today's make -", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "シェア", fontSize: 16, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
    }
    func setDelegate() {
        headerView.delegate = self
        mainView.delegate = self
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
