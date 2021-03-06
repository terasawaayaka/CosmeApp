//
//  YourPostCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourPostCollectionViewCellDelegate: NSObjectProtocol{
}
extension YourPostCollectionViewCellDelegate {
}
// MARK: - Property
class YourPostCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: YourPostCollectionViewCellDelegate? = nil
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var yourPostImsge: UIImageView!
    
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
    var userModel: UserModel = UserModel()
}
// MARK: - Life cycle
extension YourPostCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourPostCollectionViewCell {
}
// MARK: - method
extension YourPostCollectionViewCell {
    func updateCell(filterdReviewPostModels: ReviewPostModel,userModel: UserModel){
       if filterdReviewPostModels.image_paths.count != 0 {
        if let url = URL(string: filterdReviewPostModels.image_paths[0]){
            yourPostImsge.af_setImage(withURL: url) }
        }
        productLabel.text = filterdReviewPostModels.title
    }
    
}
