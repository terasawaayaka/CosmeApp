//
//  SerchGenreViewController.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/01.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
import FirebaseAuth
// MARK: - Property
class SerchGenreViewController: BaseViewController {
    //Outlet
    @IBOutlet weak var mainView: SearchGenreCollectionView!
    
    //data
 //   var makePostModels: [MakePostModel] = [MakePostModel]()
}
// MARK: - Life cycle
extension SerchGenreViewController {
    override func loadView() {
        super.loadView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        getModel()
    }
}
// MARK: - Protocol
extension SerchGenreViewController :SearchGenreCollectionViewDelegate{
    func didSelectItemAtSearchGenre(indexPath: IndexPath) {
        
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
//        let makeDetailViewController = MakeDetailViewController()
//        makeDetailViewController.makePostModel = makePostModels[indexPath.row]
//        navigationController?.pushViewController(makeDetailViewController, animated: true)
//        animatorManager.navigationType = .push
    }
}
// MARK: - method
extension SerchGenreViewController {
    func setDelegate() {
        mainView.delegate = self
    }
//    func getModel() {
//        MakePostModel.reads { (makePostModels) in
//            let filterdMakePostModels = makePostModels.filter { (makePostModel) -> Bool in
//                           if let uid = Auth.auth().currentUser?.uid {
//                               if makePostModel.post_user_id == uid {
//                                   return true
//                               } else {
//                                   return false
//                               }
//                           } else {
//                               return false
//                           }
//                       }
//                       self.mainView.getModel(makePostModels: filterdMakePostModels)
//                       self.makePostModels = filterdMakePostModels
//        }
//    }
}
