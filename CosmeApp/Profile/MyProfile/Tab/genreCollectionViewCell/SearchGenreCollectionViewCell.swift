//
//  SearchGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/01.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension SearchGenreCollectionViewCellDelegate {
}
// MARK: - Property
class SearchGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SearchGenreCollectionViewCellDelegate? = nil
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
}
// MARK: - Life cycle
extension SearchGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SearchGenreCollectionViewCell {
}
// MARK: - method
extension SearchGenreCollectionViewCell {
    func updateCell(reviewPostModel:ReviewPostModel) {
        if let url = URL(string: reviewPostModel.image_paths[0]){
            imageView.af_setImage(withURL: url)
        }
        postTitle.text = reviewPostModel.title
    }
}

