//
//  ThirteenGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/26.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ThirteenGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension ThirteenGenreCollectionViewCellDelegate {
}
// MARK: - Property
class ThirteenGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ThirteenGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ThirteenGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ThirteenGenreCollectionViewCell {
}
// MARK: - method
extension ThirteenGenreCollectionViewCell {
}
