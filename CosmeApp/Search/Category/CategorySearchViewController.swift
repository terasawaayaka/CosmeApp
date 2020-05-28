//
//  CategorySearchViewController.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/21.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework

enum CategoryType {
    case eyeShadow
    case eyeLiner
    case mascara
    case colorContact
    case eyeBrow
    case baseMake
    case hiLight
    case shading
    case cheek
    case skinCare
    case lip
    case hairCare
}
// MARK: - Property
class CategorySearchViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var mainView: CategorySearchMainView!
    
    var categoryType: CategoryType = CategoryType.eyeShadow
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
}
// MARK: - Life cycle
extension CategorySearchViewController {
    override func loadView() {
        super.loadView()
        setHeaderView()
        setDelegate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getReviewPostModel()
    }
}
// MARK: - Protocol
extension CategorySearchViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
        animatorManager.navigationType = .slide_pop
    }
}
extension CategorySearchViewController: CategorySearchMainViewDelegate {
    func didSelectItemAt() {
        let reviewDetailViewController = ReviewDetailViewController()
        navigationController?.pushViewController(reviewDetailViewController, animated: true)
        animatorManager.navigationType = .slide_push
    }
    
    
}
// MARK: - method
extension CategorySearchViewController {
    func setHeaderView(){
        headerView.setLeft(text: "検索画面へ戻る", fontSize: 16, color: #colorLiteral(red: 0.7116513325, green: 0.1774580224, blue: 0.3965806173, alpha: 1))
    }
    func setDelegate(){
        headerView.delegate = self
        mainView.delegate = self
    }
    func changeCategory(){
        switch categoryType {
        case .eyeShadow:
            if let image = UIImage(named: "EyeshadowIllust") {
                mainView.illustImage.image = image }
            if let image = UIImage(named: "EyeShadowLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "アイシャドウ"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .eyeLiner:
            if let image = UIImage(named: "EyeLinerIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "EyeLinerLOGO") {
                mainView.logoImage.image = image }
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "アイライン"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .mascara:
            if let image = UIImage(named: "MascaraIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "MascaraLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "マスカラ"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .colorContact:
            if let image = UIImage(named: "colorContackIllust"){
                mainView.illustImage.image = image}
            if let image = UIImage(named: "ColorContactLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "カラコン"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .eyeBrow:
            if let image = UIImage(named: "EyebrowIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "EyeBrowLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "アイブロウ"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .baseMake:
            if let image = UIImage(named: "baseIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "BaseLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "ベースメイク"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .hiLight:
            if let image = UIImage(named: "HiLightIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "HiLightLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "ハイライト"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .shading:
            if let image = UIImage(named: "shadingIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "ShadingLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "シェーディング"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .cheek:
            if let image = UIImage(named: "cheekIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "CheekLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "チーク"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .skinCare:
            if let image = UIImage(named: "skincareIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "SkincareLOGO") {
                mainView.logoImage.image = image}
            
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "スキンケア"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .lip:
            if let image = UIImage(named: "LipIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "LipLOGO") {
                mainView.logoImage.image = image}
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "リップ"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        case .hairCare:
            if let image = UIImage(named: "hairCareIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "HaircareLOGO") {
                mainView.logoImage.image = image}
            let filterdReviewPostModels = reviewPostModels.filter { (reviewPostModel) -> Bool in
                if reviewPostModel.category == "ヘアケア"  {
                    return true
                }else {
                    return false
                }
            }
            mainView.getReviewPostModel(reviewPostModels: filterdReviewPostModels)
            
        default:
            if let image = UIImage(named: "EyeshadowIllust") {
                mainView.illustImage.image = image}
            if let image = UIImage(named: "EyeShadowLOGO") {
                mainView.logoImage.image = image}
        }
    }
    func getReviewPostModel(){
        ReviewPostModel.reads { (reviewPostModels) in
            self.reviewPostModels = reviewPostModels
            self.mainView.getReviewPostModel(reviewPostModels: reviewPostModels)
            self.changeCategory()
        }
    }
}


