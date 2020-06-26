//
//  ThirteenYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/26.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ThirteenYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension ThirteenYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class ThirteenYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ThirteenYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ThirteenYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ThirteenYourGenreCollectionViewCell {
}
// MARK: - method
extension ThirteenYourGenreCollectionViewCell {
}
