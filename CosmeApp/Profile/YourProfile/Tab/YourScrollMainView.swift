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
    func didSelectItemAt(indexPath: IndexPath)
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
        setDelegate()
    }
}
// MARK: - Protocol
extension YourScrollMainView : YourPostCollectionViewDelegate{
    func didSelectItemAt(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectItemAt(indexPath: indexPath)
        }
    }
    
}
// MARK: - method
extension YourScrollMainView {
    func setDelegate(){
        yourPostMainView.delegate = self
    }
    func getModel(filterdReviewPostModels: [ReviewPostModel],userModel: UserModel){
        self.reviewPostModels = filterdReviewPostModels
        self.userModel = userModel
        self.yourPostMainView.getModel(filterdReviewPostModels: reviewPostModels,userModel: userModel)
    }
}
