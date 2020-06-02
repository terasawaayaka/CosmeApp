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
}
