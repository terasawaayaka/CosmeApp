//
//  TodayCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TodayCollectionViewCellDelegate: NSObjectProtocol{
}
extension TodayCollectionViewCellDelegate {
}
// MARK: - Property
class TodayCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TodayCollectionViewCellDelegate? = nil
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
}
// MARK: - Life cycle
extension TodayCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension TodayCollectionViewCell {
}
// MARK: - method
extension TodayCollectionViewCell {
    func setLayout() {
        roundView.layer.cornerRadius = roundView.frame.height / 2
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    func updataCell(makePostModel: MakePostModel) {
        //imageを読み込む処理
        switch makePostModel.image_paths.count {
        case 0:
            imageView.image = UIImage(named: "noimage.png")
        case 1:
            if let url = URL(string: makePostModel.image_paths[0]){
                imageView.af_setImage(withURL: url)
            }
        default:
            break
        }
    }
}
