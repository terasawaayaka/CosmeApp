//
//  YourTodayCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourTodayCollectionViewCellDelegate: NSObjectProtocol{
}
extension YourTodayCollectionViewCellDelegate {
}
// MARK: - Property
class YourTodayCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: YourTodayCollectionViewCellDelegate? = nil
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
}
// MARK: - Life cycle
extension YourTodayCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension YourTodayCollectionViewCell {
}
// MARK: - method
extension YourTodayCollectionViewCell {
    func setLayout() {
        roundView.layer.cornerRadius = roundView.frame.height / 2
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    func updateCell(makePostModel: MakePostModel) {
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
