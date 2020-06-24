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
    func didSelectItemAtYourGenre(indexPath: IndexPath)
    func didSelectItemAtSearchYourGenre(indexPath: IndexPath)
        func didEndYourScroll(scrollView: UIScrollView)
}
extension YourScrollMainViewDelegate {
}
// MARK: - Property
class YourScrollMainView: BaseView {
    weak var delegate: YourScrollMainViewDelegate? = nil
    //outlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var yourGenreMainView: YourGenreCollectionView!
    @IBOutlet weak var yourPostMainView: YourPostCollectionView!
    @IBOutlet weak var searchYourGenreMainView: SearchYourGenreMainView!
    
    //date
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
extension YourScrollMainView: YourGenreCollectionViewDelegate{
    func didSelectItemAtYourGenre(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtYourGenre(indexPath: indexPath)}
    }
}
extension YourScrollMainView: SearchYourGenreMainViewDelegate {
    func didSelectItemAtSearchYourGenre(indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectItemAtSearchYourGenre(indexPath: indexPath)}
    }
}
extension YourScrollMainView :UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.didEndYourScroll(scrollView: scrollView)
    }
}
// MARK: - method
extension YourScrollMainView {
    func setDelegate(){
        yourPostMainView.delegate = self
        yourGenreMainView.delegate = self
        scrollView.delegate = self
        searchYourGenreMainView.delegate = self
    }
    func getModel(filterdReviewPostModels: [ReviewPostModel],userModel: UserModel){
        self.reviewPostModels = filterdReviewPostModels
        self.userModel = userModel
        self.yourPostMainView.getModel(filterdReviewPostModels: reviewPostModels,userModel: userModel)
    }
}
