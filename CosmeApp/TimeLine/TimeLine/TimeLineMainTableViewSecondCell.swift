//
//  TimeLineMainTableViewSecondCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainTableViewSecondCellDelegate: NSObjectProtocol{
    func iconViewButton()
}
extension TimeLineMainTableViewSecondCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewSecondCell: BaseTableViewCell, UIScrollViewDelegate {
    weak var delegate: TimeLineMainTableViewSecondCellDelegate? = nil
    
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    
    //Image
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    //StarLabel
    @IBOutlet weak var firstStarLabel: UILabel!
    @IBOutlet weak var secondStarlabel: UILabel!
    @IBOutlet weak var thirdStarLabel: UILabel!
    @IBOutlet weak var fourthStarLabel: UILabel!
    @IBOutlet weak var fifthStarLabel: UILabel!
    
    //投稿Label
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var iconView: UIButton!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //Button
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.iconViewButton()}
    }
    @IBAction func goodButton(_ sender: UIButton) {
    }
    @IBAction func favoriteButton(_ sender: UIButton) {
    }
}
// MARK: - Life cycle
extension TimeLineMainTableViewSecondCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        setDelegate()
        scrollViewDidEndDecelerating(imageScrollView)
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewSecondCell {
}
// MARK: - method
extension TimeLineMainTableViewSecondCell {
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
    func setDelegate(){
        imageScrollView.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if fmod(imageScrollView.contentOffset.x, imageScrollView.frame.maxX) == 0 {
        pageControl.currentPage = Int(scrollView.contentOffset.x / imageScrollView.frame.maxX)
        }
    }
    func updateCell(reviewPostModel:ReviewPostModel){
        productLabel.text = "商品名：　" + reviewPostModel.title
        categoryLabel.text = "カテゴリ：　" + reviewPostModel.category
        
//        if let url = URL(string: reviewPostModel.image_paths[0]){
//            firstImageView.af_setImage(withURL:url)
//        }
//        if let url = URL(string: reviewPostModel.image_paths[1]){
//            secondImageView.af_setImage(withURL:url)
//        }
//        if let url = URL(string: reviewPostModel.image_paths[2]){
//            thirdImageView.af_setImage(withURL:url)
//        }
//        if let url = URL(string: reviewPostModel.image_paths[3]){
//            fourthImageView.af_setImage(withURL:url)
//        }
    }
}
