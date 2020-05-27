//
//  EditProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth
// MARK: - Property
class EditProfileViewController: BaseViewController {
    //data
    var userModel: UserModel = UserModel()
    
    //Outlet
    @IBOutlet weak var mainView: EditProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
}
// MARK: - Life cycle
extension EditProfileViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
        setHeaderView()
        hideKeybord()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giveModel()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            mainView.iconView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
// MARK: - Protocol
extension EditProfileViewController :HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func touchedRightButton(_ sender: UIButton) {
        userModel.nickname = mainView.editNameTextField.text
        
        let image = mainView.iconView.image
        UserModel.update(request: userModel, image: image) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
extension EditProfileViewController :EditProfileMainViewDelegate{
    func touchedEditIconViewButton() {
        useCamera()
    }
    
    func touchedLogoutButton() {
        UserModel.logOut {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
// MARK: - method
extension EditProfileViewController {
    func setDelegate() {
        headerView.delegate = self
        mainView.delegate = self
    }
    func setHeaderView() {
        headerView.setLeft(text: "キャンセル",fontSize: 15,color:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        headerView.setCenter(text: "プロフィールを編集", fontSize: 15, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        headerView.setRight(text: "完了", fontSize: 15, color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
    }
    func giveModel() {
        mainView.updateUserName(userModel: userModel)
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
}
