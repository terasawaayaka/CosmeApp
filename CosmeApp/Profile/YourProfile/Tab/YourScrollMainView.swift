//
//  YourScrollMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourScrollMainViewDelegate: NSObjectProtocol{
}
extension YourScrollMainViewDelegate {
}
// MARK: - Property
class YourScrollMainView: BaseView {
    weak var delegate: YourScrollMainViewDelegate? = nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var yourGenreMainView: UIView!
    @IBOutlet weak var yourPostMainView: YourPostCollectionView!
    var reviewPostModels: [ReviewPostModel] = [ReviewPostModel]()
    var userModel: UserModel = UserModel()
}
// MARK: - Life cycle
extension YourScrollMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourScrollMainView {
}
// MARK: - method
extension YourScrollMainView {
    func getModel(reviewPostModels: [ReviewPostModel],userModel: UserModel){
        self.reviewPostModels = reviewPostModels
        self.userModel = userModel
        self.yourPostMainView.getModel(reviewPostModels: reviewPostModels,userModel: userModel)
    }
}
