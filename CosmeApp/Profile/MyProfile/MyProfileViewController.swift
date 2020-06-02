//
//  MyProfileViewController.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/14.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth
// MARK: - Property
class MyProfileViewController: BaseViewController{
    //data
    var userModel: UserModel = UserModel()
    var makePostModel: MakePostModel = MakePostModel()
    var makePostModels: [MakePostModel] = [MakePostModel]()
    
    //Outlet
    @IBOutlet weak var mainView: MyProfileMainView!
    @IBOutlet weak var headerView: HeaderView!
    
    var fromPost: Bool = false
}
// MARK: - Life cycle
extension MyProfileViewController {
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
        if Auth.auth().currentUser == nil {
            let signUpViewController = SignUpViewController()
            navigationController?.pushViewController(signUpViewController, animated: false)
        }
        getModel()
    }
}
// MARK: - Protocol
extension MyProfileViewController :MyProfileMainViewDelegate{
    func touchedEyeShadowButton() {
        let searchGenreCollectionViewController = SerchGenreViewController()
        navigationController?.pushViewController(searchGenreCollectionViewController, animated: false)
    
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let makeDetailViewController = MakeDetailViewController()
        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
        makeDetailViewController.fromProfile = true
        navigationController?.pushViewController(makeDetailViewController, animated: true)
        animatorManager.navigationType = .push
    }
    
    func editProfileButton() {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.userModel = userModel
        editProfileViewController.modalPresentationStyle = .fullScreen
        present(editProfileViewController, animated: true, completion: nil)
    }
    
    func touchedGoodButton() {
        let firstPoint = CGPoint(x: 0, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(firstPoint, animated: true)
    }
    
    func touchedBookMarkButton() {
        let secondPoint = CGPoint(x: mainView.frame.width, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(secondPoint, animated: true)
    }
    
    func touchedGenreButton() {
        let thirdPoint = CGPoint(x: mainView.frame.width * 2, y: 0)
        mainView.scrollMainView.scrollView.setContentOffset(thirdPoint, animated: true)
    }
}

extension MyProfileViewController:HeaderViewDelegate{
    func touchedLeftButton(_ sender: UIButton) {
        if fromPost{
        navigationController?.popViewController(animated: true)
        animatorManager.navigationType = .slide_pop
        }
    }
}

// MARK: - method
extension MyProfileViewController {
    func setDelegate(){
        mainView.delegate = self
        headerView.delegate = self
    }
    
    func setHeaderView(){
        if fromPost{
        headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        headerView.setLeft(text: "戻る", fontSize: 18, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        }else{
            headerView.setCenter(text: "- profile -", fontSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            headerView.setLeft(text: "")
        }
    }
    
    func getModel() {
        UserModel.readMe { (userModel) in
            if let icon = userModel.photo_path {
                self.makePostModel.post_user_icon = icon
            }
            self.mainView.getModel(userModel: userModel)
            self.userModel = userModel
        }
        
        MakePostModel.reads { (makePostModels) in
            let filterdMakePostModels = makePostModels.filter { (makePostModel) -> Bool in
                if let uid = Auth.auth().currentUser?.uid {
                    if makePostModel.post_user_id == uid {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
            self.mainView.getMakeModel(makePostModels: filterdMakePostModels)
            self.makePostModels = filterdMakePostModels
        }
    }
}
