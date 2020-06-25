//
//  SearchYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/16.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension SearchYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class SearchYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SearchYourGenreCollectionViewCellDelegate? = nil
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    
}
// MARK: - Life cycle
extension SearchYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SearchYourGenreCollectionViewCell {
}
// MARK: - method
extension SearchYourGenreCollectionViewCell {
    func updateCell(reviewPostModel:ReviewPostModel) {
        if let url = URL(string: reviewPostModel.image_paths[0]){
            imageView.af_setImage(withURL: url)
        }
        postTitle.text = reviewPostModel.title
        
    }
}
