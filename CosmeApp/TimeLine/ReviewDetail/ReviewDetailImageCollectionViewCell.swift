//
//  ReviewDetailImageCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/06/17.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ReviewDetailImageCollectionViewCellDelegate: NSObjectProtocol{
}
extension ReviewDetailImageCollectionViewCellDelegate {
}
// MARK: - Property
class ReviewDetailImageCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ReviewDetailImageCollectionViewCellDelegate? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
}
// MARK: - Life cycle
extension ReviewDetailImageCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReviewDetailImageCollectionViewCell {
}
// MARK: - method
extension ReviewDetailImageCollectionViewCell {
    func updatecollectionView(imagePath:String){
        if let url = URL(string: imagePath){
            imageView.af_setImage(withURL: url)
        }
    }
}
