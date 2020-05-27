//
//  TimeLineMainCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainCollectionViewCellDelegate: NSObjectProtocol{
}
extension TimeLineMainCollectionViewCellDelegate {
}
// MARK: - Property
class TimeLineMainCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TimeLineMainCollectionViewCellDelegate? = nil

    @IBOutlet weak var makeIconView: UIImageView!
}
// MARK: - Life cycle
extension TimeLineMainCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension TimeLineMainCollectionViewCell {
}
// MARK: - method
extension TimeLineMainCollectionViewCell {
    func setLayout(){
        makeIconView.layer.cornerRadius = makeIconView.frame.width / 2
    }
    func updatecollectionView(makePostModel:MakePostModel){
        if let url = URL(string: makePostModel.image_paths[0]){
            makeIconView.af_setImage(withURL: url)
        }
    }
}
