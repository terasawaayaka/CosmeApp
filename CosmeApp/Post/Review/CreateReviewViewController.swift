//
//  CreateReviewViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
// MARK: - Property
class CreateReviewViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CreateReviewMainView!
    //Constrains
    @IBOutlet weak var mainViewBottomMargin: NSLayoutConstraint!

    
    let items = ["ベースメイク","ハイライト","シェーディング","アイシャドウ","アイライナー","マスカラ","カラコン","アイブロウ","チーク","リップ","スキンケア","ヘアケア","その他"]
    let loadingView: LoadingView = LoadingView()
}
// MARK: - Life cycle
extension CreateReviewViewController {
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
            mainView.itemFirstImageVIew.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - Protocol
extension CreateReviewViewController:HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
    }
    func touchedRightButton(_ sender: UIButton) {
        let reviewPostModel: ReviewPostModel = ReviewPostModel()
        if let text = mainView.itemTextView.text {
            reviewPostModel.title = text
        }
        if let text = mainView.pickerLabel.text {
            reviewPostModel.category = text
        }
        if let text = mainView.reviewTextView.text {
            reviewPostModel.review = text
        }
        if let text = mainView.tagTextView.text {
            reviewPostModel.tag = text
        }
        var images:[UIImage] = []
        if let image = mainView.itemFirstImageVIew.image {
            images.append(image)
        }
        //todo imageつなぐ
        
        addLoadingView()
        
        ReviewPostModel.create(request: reviewPostModel, images: images) {
            let timeLineViewController = TimeLineViewController()
            self.navigationController?.pushViewController(timeLineViewController, animated: true)
            self.animatorManager.navigationType = .pop
        }
    }
}

extension CreateReviewViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}
extension CreateReviewViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    //行が選択された時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainView.pickerLabel.text = items[row]
    }
}

extension CreateReviewViewController:CreateReviewMainViewDelegate {
    func touchedAddFirstImageButton() {
        useCamera()
    }
    func touchedAddSecondImageButton() {
        //todo
    }
    func touchedAddThirdImageButton() {
        //todo
    }
    func touchedAddFourthImageButton() {
        //todo
    }
    func firstStarButton() {
        //todo
    }
    func secondStarButton() {
        //todo
    }
    
    func thirdStarButton() {
        //todo
    }
    
    func fourthStarButton() {
        //todo
    }
    
    func fifthStarButton() {
        //todo
    }
}
// MARK: - method
extension CreateReviewViewController {
    func setHeaderView() {
        headerView.setLeft(text: "戻る", fontSize: 16, color: UIColor.blue)
        headerView.setCenter(text: "新規レビュー", fontSize: 19, color: UIColor.black)
        headerView.setRight(text: "シェア", fontSize: 16, color: UIColor.blue)
    }
    func setDelegate() {
        headerView.delegate = self
        mainView.delegate = self
        mainView.pickerView.dataSource = self
        mainView.pickerView.delegate = self
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
