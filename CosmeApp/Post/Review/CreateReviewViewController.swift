//
//  CreateReviewViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

enum ImageViewType2 {
    case first
    case second
    case third
    case fourth
}

import PGFramework
import FirebaseAuth

// MARK: - Property
class CreateReviewViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CreateReviewMainView!
    //Constrains
    @IBOutlet weak var mainViewBottomMargin: NSLayoutConstraint!

    var imageViewType2: ImageViewType2 = ImageViewType2.first
    
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
        switch imageViewType2 {
        case .first:
            if let image = info[.originalImage] as? UIImage {
                mainView.itemFirstImageVIew.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        case .second:
            if let image = info[.originalImage] as? UIImage {
                mainView.itemSecondImageView.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        case .third:
            if let image = info[.originalImage] as? UIImage {
                mainView.itemThirdImageView.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        case .fourth:
            if let image = info[.originalImage] as? UIImage {
                mainView.itemFourthImageView.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        default:
            break
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
        
        
        var images:[UIImage] = []
        if let image = mainView.itemFirstImageVIew.image {
            images.append(image)
        }
        if let image = mainView.itemSecondImageView.image {
            images.append(image)
        }
        if let image = mainView.itemThirdImageView.image {
            images.append(image)
        }
        if let image = mainView.itemFourthImageView.image {
            images.append(image)
        }
        
        if let uid = Auth.auth().currentUser?.uid {
            reviewPostModel.post_user_id = uid
        }
        
        addLoadingView()
        
        ReviewPostModel.create(request: reviewPostModel, images: images) {
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
        imageViewType2 = ImageViewType2.first
        useCamera()
    }
    func touchedAddSecondImageButton() {
        imageViewType2 = ImageViewType2.second
        useCamera()
    }
    func touchedAddThirdImageButton() {
        imageViewType2 = ImageViewType2.third
        useCamera()
    }
    func touchedAddFourthImageButton() {
        imageViewType2 = ImageViewType2.fourth
        useCamera()
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
        mainView.isSecondStarSelected = !mainView.isSecondStarSelected
        mainView.isThirdStarSelected = false
        mainView.isFourthStarSelected = false
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func thirdStarButton() {
        mainView.isThirdStarSelected = !mainView.isThirdStarSelected
        mainView.isFourthStarSelected = false
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func fourthStarButton() {
        mainView.isFourthStarSelected = !mainView.isFourthStarSelected
        mainView.isFifthStarSelected = false
        mainView.updateStar()
    }
    
    func fifthStarButton() {
        mainView.isFifthStarSelected = !mainView.isFifthStarSelected
        mainView.updateStar()
    }
}
// MARK: - method
extension CreateReviewViewController {
    func setHeaderView() {
        headerView.setLeft(text: "<", fontSize: 18, color: #colorLiteral(red: 0.7404877639, green: 0.7449720201, blue: 1, alpha: 1))
        headerView.setCenter(text: "- new review -", fontSize: 19, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        headerView.setRight(text: "シェア", fontSize: 18, color: #colorLiteral(red: 0.9998587966, green: 0.6216878295, blue: 0.7893074155, alpha: 1))
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
