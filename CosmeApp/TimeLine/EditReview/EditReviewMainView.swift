//
//  EditReviewMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol EditReviewMainViewDelegate: NSObjectProtocol{
    func postDeleteButton()
    func firstAddButton()
    func secondAddButton()
    func thirdAddButton()
    func fourthAddButton()
    func firstStarButton()
    func secondStarButton()
    func thirdStarButton()
    func fourthStarButton()
    func fifthStarButton()
    
}

extension EditReviewMainViewDelegate {
}
// MARK: - Property
class EditReviewMainView: BaseView {
    weak var delegate: EditReviewMainViewDelegate? = nil
    
    //star
    @IBAction func firstStarButtton(_ sender: UIButton) {
        if let delegate = delegate {delegate.firstStarButton()}
    }
    @IBAction func secondStarButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.secondStarButton()}
    }
    @IBAction func thirdStarButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.thirdStarButton()}
    }
    @IBAction func fourthStarButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.fourthStarButton()}
    }
    @IBAction func fifthStarButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.fifthStarButton()}
    }
    @IBOutlet weak var firstStarButton: UIButton!
    @IBOutlet weak var secondStarButton: UIButton!
    @IBOutlet weak var thirdStarButton: UIButton!
    @IBOutlet weak var fourthStarButton: UIButton!
    @IBOutlet weak var fifthStarButton: UIButton!
    
    var isFirstStarSelected: Bool = false
    var isSecondStarSelected: Bool = false
    var isThirdStarSelected: Bool = false
    var isFourthStarSelected: Bool = false
    var isFifthStarSelected: Bool = false
    
    
    //image
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    //pickerView
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewLabel: UILabel!
    
    //review
    @IBOutlet weak var titleTextField: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var reviewTextField: UITextView!
    @IBOutlet weak var tagTextField: UITextView!
    
    //button
    @IBAction func postDeleteButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.postDeleteButton()}
    }
    @IBAction func firstAddButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.firstAddButton()}
    }
    @IBAction func secondAddButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.secondAddButton()}
    }
    @IBAction func thirdAddButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.thirdAddButton()}
    }
    @IBAction func fourthAddButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.fourthAddButton()}
    }
}
// MARK: - Life cycle
extension EditReviewMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditReviewMainView {
    
}
// MARK: - method
extension EditReviewMainView {
    func updateReview(reviewPostModel:ReviewPostModel){
        //テキスト
        titleTextField.text = reviewPostModel.title
        categoryLabel.text = reviewPostModel.category
        reviewTextField.text = reviewPostModel.review
        tagTextField.text = reviewPostModel.tag
        
        //画像
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
        
        //星の数
        if case reviewPostModel.review_num = 5{
            if let image = UIImage(named: "checkedStar"){
                firstStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                secondStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                thirdStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                fourthStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                fifthStarButton.setImage(image, for: .normal)
            }
        }
        if case reviewPostModel.review_num = 4{
            if let image = UIImage(named: "checkedStar"){
                firstStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                secondStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                thirdStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                fourthStarButton.setImage(image, for: .normal)
            }
        }
        if case reviewPostModel.review_num = 3{
            if let image = UIImage(named: "checkedStar"){
                firstStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                secondStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                thirdStarButton.setImage(image, for: .normal)
            }
        }
        if case reviewPostModel.review_num = 2{
            if let image = UIImage(named: "checkedStar"){
                firstStarButton.setImage(image, for: .normal)
            }
            if let image = UIImage(named: "checkedStar"){
                secondStarButton.setImage(image, for: .normal)
            }
        }
        if case reviewPostModel.review_num = 1{
            if let image = UIImage(named: "checkedStar"){
                firstStarButton.setImage(image, for: .normal)
            }
        }
    }
    
    func updateStar() {
    if isFirstStarSelected {
      let image = UIImage(named: "checkedStar")
          firstStarButton.setImage(image, for: .normal)
      } else {
          let image = UIImage(named: "star")
          firstStarButton.setImage(image, for: .normal)
    }
    if isSecondStarSelected {
        let image = UIImage(named: "checkedStar")
        secondStarButton.setImage(image, for: .normal)
    } else {
        let image = UIImage(named: "star")
        secondStarButton.setImage(image, for: .normal)
    }
    if isThirdStarSelected {
        let image = UIImage(named: "checkedStar")
        thirdStarButton.setImage(image, for: .normal)
    } else {
        let image = UIImage(named: "star")
        thirdStarButton.setImage(image, for: .normal)
    }
    if isFourthStarSelected {
        let image = UIImage(named: "checkedStar")
        fourthStarButton.setImage(image, for: .normal)
    } else {
        let image = UIImage(named: "star")
        fourthStarButton.setImage(image, for: .normal)
    }
    if isFifthStarSelected {
        let image = UIImage(named: "checkedStar")
        fifthStarButton.setImage(image, for: .normal)
    } else {
        let image = UIImage(named: "star")
        fifthStarButton.setImage(image, for: .normal)
        }
    }
}
