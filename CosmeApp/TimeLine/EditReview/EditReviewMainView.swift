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
}

extension EditReviewMainViewDelegate {
}
// MARK: - Property
class EditReviewMainView: BaseView {
    weak var delegate: EditReviewMainViewDelegate? = nil
    
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
    
    @IBAction func postDeleteButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.postDeleteButton()}
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
        titleTextField.text = reviewPostModel.title
        categoryLabel.text = reviewPostModel.category
        reviewTextField.text = reviewPostModel.review
        tagTextField.text = reviewPostModel.tag
    }
}
