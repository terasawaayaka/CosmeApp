//
//  SearchResultCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchResultCollectionViewCellDelegate: NSObjectProtocol{
    func touchedCellButton(reviewPostModel: ReviewPostModel)
}
extension SearchResultCollectionViewCellDelegate {
}
// MARK: - Property
class SearchResultCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SearchResultCollectionViewCellDelegate? = nil
    @IBOutlet weak var imaveView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    @IBAction func touchedCellButton(_ sender: UIButton) {
        if let delegate = delegate{
            delegate.touchedCellButton(reviewPostModel: reviewPostModel)
        }
    }
    var reviewPostModel: ReviewPostModel = ReviewPostModel()
}
// MARK: - Life cycle
extension SearchResultCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCell()
    }
}
// MARK: - Protocol
extension SearchResultCollectionViewCell {
}
// MARK: - method
extension SearchResultCollectionViewCell {
    func updateCell(){
        cellWidth.constant = (UIScreen.main.bounds.size.width - 60) / 3
    }
    
    func updateReviewCell(reviewPostModel: ReviewPostModel){
        self.reviewPostModel = reviewPostModel
        nameLabel.text = reviewPostModel.title
        if reviewPostModel.image_paths.count != 0 {
            if let url = URL(string: reviewPostModel.image_paths[0])  {
            imaveView.af_setImage(withURL: url)
            }
        }
        
    }
}

