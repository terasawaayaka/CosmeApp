//
//  BookmarkCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol BookmarkCollectionViewCellDelegate: NSObjectProtocol{
}
extension BookmarkCollectionViewCellDelegate {
}
// MARK: - Property
class BookmarkCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: BookmarkCollectionViewCellDelegate? = nil
    @IBOutlet weak var imageView: UIImageView!
}
// MARK: - Life cycle
extension BookmarkCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension BookmarkCollectionViewCell {
}
// MARK: - method
extension BookmarkCollectionViewCell {
    func updateCell(reviewPostModel:ReviewPostModel) {
//        switch reviewPostModel.image_paths.count {
//        case 0:
//            imageView.image = UIImage(named: "noimage.png")
//        case 1:
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                imageView.af_setImage(withURL: url)
//            }
//        default:
//            break
//        }
        if let url = URL(string: reviewPostModel.image_paths[0]){
            imageView.af_setImage(withURL: url)
        }
    }
}
