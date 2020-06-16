//
//  TimeLineImageCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/06/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TimeLineImageCollectionViewCellDelegate: NSObjectProtocol{
}
extension TimeLineImageCollectionViewCellDelegate {
}
// MARK: - Property
class TimeLineImageCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TimeLineImageCollectionViewCellDelegate? = nil
    @IBOutlet weak var imageView: UIImageView!

}
// MARK: - Life cycle
extension TimeLineImageCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TimeLineImageCollectionViewCell {
}
// MARK: - method
extension TimeLineImageCollectionViewCell {
    func updatecollectionView(image_path:String){
                        if let url = URL(string: image_path){
                            imageView.af_setImage(withURL: url)
                        }
                    }
}
     
//        switch reviewPostModel.image_paths.count {
//        case 0:
//            if reviewPostModel.image_paths.count == 1{
//                if let url = URL(string: reviewPostModel.image_paths[0]){
//                    imageView.af_setImage(withURL: url)
//                }
//            }
//        case 1 :
//            if reviewPostModel.image_paths.count == 2 {
//                if let url = URL(string: reviewPostModel.image_paths[0]){
//                    imageView.af_setImage(withURL: url)
//                }
//                if let url = URL(string: reviewPostModel.image_paths[1]){
//                    imageView.af_setImage(withURL: url)
//                }
//            }
//        case 2:
//            if reviewPostModel.image_paths.count == 3 {
//                if let url = URL(string: reviewPostModel.image_paths[0]){
//                    imageView.af_setImage(withURL: url)
//                }
//                if let url = URL(string: reviewPostModel.image_paths[1]){
//                    imageView.af_setImage(withURL: url)
//                }
//                if let url = URL(string: reviewPostModel.image_paths[2]){
//                    imageView.af_setImage(withURL: url)
//                }
//            }
//        case 3:
//            if reviewPostModel.image_paths.count == 4{
//            if let url = URL(string: reviewPostModel.image_paths[0]){
//                imageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[1]){
//                imageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[2]){
//                imageView.af_setImage(withURL: url)
//            }
//            if let url = URL(string: reviewPostModel.image_paths[3]){
//                imageView.af_setImage(withURL: url)
//            }
//            }
//        default:
//            break
//        }
//    }
//}
