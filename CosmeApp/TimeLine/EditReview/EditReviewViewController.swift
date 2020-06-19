//
//  EditReviewViewController.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

enum ImageViewType {
case first
case second
case third
case fourth
}

import PGFramework
// MARK: - Property
class EditReviewViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: EditReviewMainView!
    @IBOutlet weak var mainViewBottomMergin: NSLayoutConstraint!
    
    var imageViewType : ImageViewType = ImageViewType.first
    
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    var noticeModel: NoticeModel = NoticeModel()
    
    let items = ["ベースメイク", "シェーディング", "ハイライト", "チーク", "アイシャドウ","アイライン","マスカラ","カラコン","アイブロウ","リップ","ヘアケア","スキンケア","その他"]
    }

    let loadingView: LoadingView = LoadingView()

// MARK: - Life cycle
extension EditReviewViewController {
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
        giveModel()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    switch imageViewType {
    case .first:
        if let image = info[.originalImage] as? UIImage {
            mainView.firstImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    case .second:
        if let image = info[.originalImage] as? UIImage {
            mainView.secondImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    case .third:
        if let image = info[.originalImage] as? UIImage {
            mainView.thirdImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    case .fourth:
        if let image = info[.originalImage] as? UIImage {
            mainView.fourthImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    default:
        break
        }
    }
}
// MARK: - Protocol
extension EditReviewViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        //テキスト
        if let text = mainView.titleTextField.text {
            reviewPostModel.title = text
        }
        if let text = mainView.categoryLabel.text{
            reviewPostModel.category = text
        }
        if let text = mainView.reviewTextField.text {
            reviewPostModel.review = text
        }
        if let text = mainView.tagTextField.text {
            reviewPostModel.tag = text
        }
        //画像
        var images : [UIImage] = []
        if let image = mainView.firstImageView.image{
            images.append(image)
        }
        if let image = mainView.secondImageView.image{
            images.append(image)
        }
        if let image = mainView.thirdImageView.image{
            images.append(image)
        }
        if let image = mainView.fourthImageView.image{
            images.append(image)
        }
        
        
        //星
        if mainView.isFifthStarSelected == true {
            reviewPostModel.review_num = 5
        } else if mainView.isFourthStarSelected == true {
            reviewPostModel.review_num = 4
        } else if mainView.isThirdStarSelected == true {
            reviewPostModel.review_num = 3
        } else if mainView.isSecondStarSelected == true {
            reviewPostModel.review_num = 2
        } else if mainView.isFirstStarSelected == true {
            reviewPostModel.review_num = 1
        }
        
        addLoadingView()
        
        ReviewPostModel.update(request: reviewPostModel, images: images) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension EditReviewViewController:EditReviewMainViewDelegate{
    func firstDeleteButton() {
        mainView.firstImageView.image = UIImage(named: "")
    }
    
    func secondDeleteButton() {
        mainView.secondImageView.image = UIImage(named: "")
    }
    
    func thirdDeleteButton() {
        mainView.thirdImageView.image = UIImage(named: "")
    }
    
    func fourthDeleteButton() {
        mainView.fourthImageView.image = UIImage(named: "")
    }
    
    func firstStarButton() {
        mainView.isFirstStarSelected = !mainView.isFirstStarSelected
        mainView.isSecondStarSelected = false
        mainView.isThirdStarSelected = false
        mainView.isFourthStarSelected = false
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func secondStarButton() {
        mainView.isSecondStarSelected = !mainView.isFirstStarSelected
        mainView.isThirdStarSelected = false
        mainView.isFourthStarSelected = false
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func thirdStarButton() {
        mainView.isThirdStarSelected = !mainView.isFirstStarSelected
        mainView.isFourthStarSelected = false
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func fourthStarButton() {
        mainView.isFourthStarSelected = !mainView.isFirstStarSelected
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func fifthStarButton() {
        mainView.isFifthStarSelected = !mainView.isFirstStarSelected
        mainView.updateStar()
    }
    
    func firstAddButton() {
        imageViewType = ImageViewType.first
        useCamera()
    }
    
    func secondAddButton() {
        imageViewType = ImageViewType.second
        useCamera()
    }
    
    func thirdAddButton() {
        imageViewType = ImageViewType.third
        useCamera()
    }
    
    func fourthAddButton() {
        imageViewType = ImageViewType.fourth
        useCamera()
    }
    
    func postDeleteButton() {
        NoticeModel.reads { (noticeModels) in
            for noticeModel in noticeModels {
                if noticeModel.post_id == self.reviewPostModel.id {
                    NoticeModel.delete(id: noticeModel.id) {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
        ReviewPostModel.delete(id: reviewPostModel.id) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

extension EditReviewViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension EditReviewViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    //行が選択された時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainView.pickerViewLabel.text = items[row]
    }
}
// MARK: - method
extension EditReviewViewController {
    func setHeaderView(){
        headerView.setLeft(text: "キャンセル", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "レビュー編集", fontSize: 20, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 18, color: #colorLiteral(red: 1, green: 0.6230913235, blue: 0.7894609614, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
        mainView.pickerView.dataSource = self
        mainView.pickerView.delegate = self
    }
    func giveModel(){
        mainView.updateReview(reviewPostModel:reviewPostModel)
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

