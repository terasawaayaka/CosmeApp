//
//  GoodCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol GoodCollectionViewCellDelegate: NSObjectProtocol{
}
extension GoodCollectionViewCellDelegate {
}
// MARK: - Property
class GoodCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: GoodCollectionViewCellDelegate? = nil
    @IBOutlet weak var imageView: UIImageView!
}
// MARK: - Life cycle
extension GoodCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension GoodCollectionViewCell {
}
// MARK: - method
extension GoodCollectionViewCell {
    func updateCell(noticeModel:NoticeModel) {
        switch noticeModel.image_paths.count {
        case 0:
            imageView.image = UIImage(named: "noimage.png")
        case 1:
            if let url = URL(string: noticeModel.image_paths[0]){
                imageView.af_setImage(withURL: url)
            }
        default:
            break
        }
    }
}
