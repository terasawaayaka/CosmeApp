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
    
    @IBOutlet weak var firstStarImage: UIImageView!
    @IBOutlet weak var secondStarImage: UIImageView!
    @IBOutlet weak var thirdStarImage: UIImageView!
    @IBOutlet weak var fourthStarImage: UIImageView!
    @IBOutlet weak var fifthStarImage: UIImageView!
    
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
        
//        switch reviewPostModel.review_num {
//        case 0:
//            if case let reviewPostModel.review_num = 5{
//                firstStarImage.image = UIImage(named: "checkedStar")
//            }
//        case 1:
//        case 2:
//        case 3:
//        case 4:
//
//            <#code#>
//        default:
//            break
//        }
        if case reviewPostModel.review_num = 5{
            firstStarImage.image = UIImage(named: "checkedStar")
            secondStarImage.image = UIImage(named: "checkedStar")
            thirdStarImage.image = UIImage(named: "checkedStar")
            fourthStarImage.image = UIImage(named: "checkedStar")
            fifthStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 4{
            firstStarImage.image = UIImage(named: "checkedStar")
            secondStarImage.image = UIImage(named: "checkedStar")
            thirdStarImage.image = UIImage(named: "checkedStar")
            fourthStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 3{
            firstStarImage.image = UIImage(named: "checkedStar")
            secondStarImage.image = UIImage(named: "checkedStar")
            thirdStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 2{
            firstStarImage.image = UIImage(named: "checkedStar")
            secondStarImage.image = UIImage(named: "checkedStar")
        }
        if case reviewPostModel.review_num = 1{
            firstStarImage.image = UIImage(named: "checkedStar")
        }
       
        switch reviewPostModel.image_paths.count {
        case 0:
            firstImageView.image = UIImage(named: "noimage.png")
            secondImageView.image = UIImage(named: "noimage.png")
            thirdImageView.image = UIImage(named: "noimage.png")
            fourthImageView.image = UIImage(named: "noimage.png")
            
        case 1:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                firstImageView.af_setImage(withURL: url)
            }
            secondImageView.image = UIImage(named: "noimage.png")
            thirdImageView.image = UIImage(named: "noimage.png")
            fourthImageView.image = UIImage(named: "noimage.png")
        case 2:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                secondImageView.af_setImage(withURL: url)
            }
            thirdImageView.image = UIImage(named: "noimage.png")
            fourthImageView.image = UIImage(named: "noimage.png")
        case 3:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                secondImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[2]){
                thirdImageView.af_setImage(withURL: url)
            }
            fourthImageView.image = UIImage(named: "noimage.png")

        case 4:
            if let url = URL(string: reviewPostModel.image_paths[0]){
                firstImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[1]){
                secondImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[2]){
                thirdImageView.af_setImage(withURL: url)
            }
            if let url = URL(string: reviewPostModel.image_paths[3]){
                fourthImageView.af_setImage(withURL: url)
            }
        default:
            break
        }
    }
}
