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
}
