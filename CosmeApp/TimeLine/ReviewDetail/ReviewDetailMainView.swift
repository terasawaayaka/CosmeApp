//
//  ReviewDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth

protocol ReviewDetailMainViewDelegate: NSObjectProtocol{
    func iconViewButton(reviewPostModel:ReviewPostModel)
    func commentIconViewCutton(commentPostModel:CommentPostModel)
    func commentSendButton()
    func goodButton(reviewPostModel: ReviewPostModel)
    func favoriteButton(reviewPostModel:ReviewPostModel)
    func deleteButton(commentPostModel:CommentPostModel)
    func touchedReportButton()
}
extension ReviewDetailMainViewDelegate {
}
// MARK: - Property
class ReviewDetailMainView: BaseView, UIScrollViewDelegate, UICollectionViewDelegate {
    weak var delegate: ReviewDetailMainViewDelegate? = nil
    
    //star
    @IBOutlet weak var firstStarImage: UIImageView!
    @IBOutlet weak var secondStarImage: UIImageView!
    @IBOutlet weak var thirdStarImage: UIImageView!
    @IBOutlet weak var fourthStarImage: UIImageView!
    @IBOutlet weak var fifthStarImage: UIImageView!
    
    //image
//    @IBOutlet weak var firstImageView: UIImageView!
//    @IBOutlet weak var secondImageView: UIImageView!
//    @IBOutlet weak var thirdImageView: UIImageView!
//    @IBOutlet weak var fourthImageView: UIImageView!
//    
    //review
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var reviewLabel: UITextView!
    @IBOutlet weak var tagLabel: UILabel!
    
    var commentPostModels : [CommentPostModel]=[CommentPostModel]()
    var commentPostModel : CommentPostModel = CommentPostModel()
    var reviewPostModel : ReviewPostModel = ReviewPostModel()
    var noticeModels: [NoticeModel] = [NoticeModel]()
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconView: UIButton!
    @IBOutlet weak var userName: UILabel!
    
   
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var touchedReportButton: UIButton!
    
    
    //button
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.iconViewButton(reviewPostModel: reviewPostModel)}
    }
    @IBAction func commentSendButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.commentSendButton()}
        
    }
    @IBAction func goodButton(_ sender: UIButton) {
        delegate?.goodButton(reviewPostModel: reviewPostModel)
        UIView.animate(withDuration: 0.5) {
            self.goodButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*180)
            self.goodButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*360)
        }
    }
    @IBAction func favoriteButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.favoriteButton(reviewPostModel: reviewPostModel)}
        UIView.animate(withDuration: 0.5) {
            self.favoriteButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*180)
            self.favoriteButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/180*360)
        }
    }
    @IBAction func touchedReportButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedReportButton()
        }
    }
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var isGoodButtonTouched: Bool = false
    var isFavoriteButtonTouched : Bool = false
    
}
// MARK: - Life cycle
extension ReviewDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        setLayout()
        scrollViewDidEndDecelerating(imageCollectionView)
       
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReviewDetailMainTableViewCell")
        loadCollectionViewCellFromXib(collectionView: imageCollectionView, cellName: "ReviewDetailImageCollectionViewCell")
        
    }
}
// MARK: - Protocol
extension ReviewDetailMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentPostModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewDetailMainTableViewCell")as? ReviewDetailMainTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        cell.updateCell(commentPostModel:commentPostModels[indexPath.row])
        return cell
    }
}

extension ReviewDetailMainView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reviewPostModel.image_paths.count == 0{
            return 1
        }else{
            return reviewPostModel.image_paths.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewDetailImageCollectionViewCell", for: indexPath)as? ReviewDetailImageCollectionViewCell else{return UICollectionViewCell()}
        cell.cellHeight.constant = imageCollectionView.frame.height
        if reviewPostModel.image_paths.count == 0 {
            cell.imageView.image = UIImage(named: "noimage")
        } else {
//            reviewPostModel.image_paths.forEach { (imagePath) in
//                if imagePath.contains("\(indexPath.row)?") {
                    cell.updatecollectionView(imagePath: reviewPostModel.image_paths[indexPath.row])
                }
//            }
//        }
        return cell
    }
}

extension ReviewDetailMainView:ReviewDetailMainTableViewCellDelegate{
    func deleteButton(commentPostModel: CommentPostModel) {
        if let delegate = delegate {delegate.deleteButton(commentPostModel: commentPostModel)}
    }
    
    func commentIconViewButton(commentPostModel: CommentPostModel) {
        if let delegate = delegate {delegate.commentIconViewCutton(commentPostModel: commentPostModel)}
    }
}

// MARK: - method
extension ReviewDetailMainView {
    func setDelegate(){
        tableView.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    func commentGetModel(commentPostModels:[CommentPostModel]){
        self.commentPostModels = commentPostModels
        tableView.reloadData()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
    func reviewGetModel(reviewPostModel:ReviewPostModel){
        self.reviewPostModel = reviewPostModel
        //pageControlの数
        pageControl.numberOfPages = reviewPostModel.image_paths.count
      
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
        updateGood()
        updateFavorite()
        updateReport()
    }
    
    func setLayout(){
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = iconView.frame.width / 2
        imageCollectionViewFlowLayout.estimatedItemSize = CGSize(width: 10, height: 10)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if fmod(imageCollectionView.contentOffset.x, imageCollectionView.frame.maxX) == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / imageCollectionView.frame.maxX)
        }
    }

    func updateGood() {
        if let uid = Auth.auth().currentUser?.uid {
            if reviewPostModel.post_user_id == uid {
                goodButton.isHidden = true
            } else {
                goodButton.isHidden = false
            }
        }
        if isGoodButtonTouched {
            let image = UIImage(named: "good")
            goodButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "notgood")
            goodButton.setImage(image, for: .normal)
        }
    }
    func updateFavorite() {
        if let uid = Auth.auth().currentUser?.uid {
                 if reviewPostModel.post_user_id == uid {
                     favoriteButton.isHidden = true
                 } else {
                     favoriteButton.isHidden = false
                 }
             }
        if isFavoriteButtonTouched {
            let image = UIImage(named: "favorite")
            favoriteButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "notfavorite")
            favoriteButton.setImage(image, for: .normal)
        }
    }
    func updateReport() {
        if let uid = Auth.auth().currentUser?.uid {
            if reviewPostModel.post_user_id == uid {
                touchedReportButton.isHidden = true
            } else {
                touchedReportButton.isHidden = false
            }
        }
    }
}
