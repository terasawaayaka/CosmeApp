//
//  TimeLineMainTableViewSecondCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth

protocol TimeLineMainTableViewSecondCellDelegate: NSObjectProtocol{
    func iconViewButton(reviewPostModel :ReviewPostModel)
    func goodButton(reviewPostModel: ReviewPostModel)
    func favoriteButton(reviewPostModel:ReviewPostModel)
}
extension TimeLineMainTableViewSecondCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewSecondCell: BaseTableViewCell, UIScrollViewDelegate {
    weak var delegate: TimeLineMainTableViewSecondCellDelegate? = nil
    
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    //Image
//    @IBOutlet weak var firstImageView: UIImageView!
//    @IBOutlet weak var secondImageView: UIImageView!
//    @IBOutlet weak var thirdImageView: UIImageView!
//    @IBOutlet weak var fourthImageView: UIImageView!
    
    //star
    @IBOutlet weak var firstStarImage: UIImageView!
    @IBOutlet weak var secondStarImage: UIImageView!
    @IBOutlet weak var thirdStarImage: UIImageView!
    @IBOutlet weak var fourthStarImage: UIImageView!
    @IBOutlet weak var fifthStarImage: UIImageView!
    
    //投稿Label
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //user
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var iconView: UIButton!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //Button
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.iconViewButton(reviewPostModel: reviewPostModel)}
    }
    
    @IBAction func goodButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
                   self.goodButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*180)
                   self.goodButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*360)
               }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.delegate?.goodButton(reviewPostModel: self.reviewPostModel)
        }
    }
    @IBOutlet weak var goodButton: UIButton!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            if let delegate = self.delegate{delegate.favoriteButton(reviewPostModel: self.reviewPostModel)
            }
            UIView.animate(withDuration: 0.5) {
                self.favoriteButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*180)
                self.favoriteButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*360)
            }
        }
    }
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isGoodButtonTouched : Bool = false

}
// MARK: - Life cycle
extension TimeLineMainTableViewSecondCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        setDelegate()
//        scrollViewDidEndDecelerating(imageScrollView)
        
        loadCollectionViewCellFromXib(collectionView: imageCollectionView, cellName: "TimeLineImageCollectionViewCell")
        
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewSecondCell :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return reviewPostModel.image_paths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "TimeLineImageCollectionViewCell", for: indexPath)as? TimeLineImageCollectionViewCell else{return UICollectionViewCell()}
        cell.cellHeight.constant = imageCollectionView.frame.height
        cell.updatecollectionView(imagePath: reviewPostModel.image_paths[indexPath.row])
        return cell
    }
    
}
// MARK: - method
extension TimeLineMainTableViewSecondCell {
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
        imageCollectionViewFlowLayout.estimatedItemSize = CGSize(width: 10, height: 10)
    }
    func setDelegate(){
        //imageScrollView.delegate = self
        imageCollectionView.dataSource = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if fmod(imageScrollView.contentOffset.x, imageScrollView.frame.maxX) == 0 {
        pageControl.currentPage = Int(scrollView.contentOffset.x / imageScrollView.frame.maxX)
        }
    }
    func updateCell(reviewPostModel:ReviewPostModel){
        self.reviewPostModel = reviewPostModel
        //text
        productLabel.text = "商品名：　" + reviewPostModel.title
        categoryLabel.text = "カテゴリ：　" + reviewPostModel.category
        
        //星の数
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
       
        //画像
//        switch reviewPostModel.image_paths.count {
//        case 0:
//            firstImageView.image = UIImage(named: "noimage.png")
//            secondImageView.image = UIImage(named: "noimage.png")
//            thirdImageView.image = UIImage(named: "noimage.png")
//            fourthImageView.image = UIImage(named: "noimage.png")
//
//        case 1:
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                firstImageView.af_setImage(withURL: url)
//            }
//            secondImageView.image = UIImage(named: "noimage.png")
//            thirdImageView.image = UIImage(named: "noimage.png")
//            fourthImageView.image = UIImage(named: "noimage.png")
//        case 2:
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                firstImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[1]){
//                secondImageView.af_setImage(withURL: url)
//            }
//            thirdImageView.image = UIImage(named: "noimage.png")
//            fourthImageView.image = UIImage(named: "noimage.png")
//        case 3:
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                firstImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[1]){
//                secondImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[2]){
//                thirdImageView.af_setImage(withURL: url)
//            }
//            fourthImageView.image = UIImage(named: "noimage.png")
//
//        case 4:
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                firstImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[1]){
//                secondImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[2]){
//                thirdImageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[3]){
//                fourthImageView.af_setImage(withURL: url)
//            }
//        default:
//            break
//        }
//
        if reviewPostModel.post_user_name == ""{
            userName.text = "メンバーがいません"
        }else{
            userName.text = reviewPostModel.post_user_name
        }
        if let photo_path = reviewPostModel.post_user_icon{
            if let url = URL(string: photo_path){
                iconView.af_setImage(for: .normal, url: url)
            }
        }
        if reviewPostModel.isGood == true {
           let image = UIImage(named: "good")
                goodButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "notgood")
            goodButton.setImage(image, for: .normal)
        }
        if reviewPostModel.isFavorite == true {
           let image = UIImage(named: "favorite")
            favoriteButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "notfavorite")
            favoriteButton.setImage(image, for: .normal)
        }

    }

}
