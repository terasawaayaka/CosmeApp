//
//  TwelveGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/29.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TwelveGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension TwelveGenreCollectionViewCellDelegate {
}
// MARK: - Property
class TwelveGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TwelveGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension TwelveGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TwelveGenreCollectionViewCell {
}
// MARK: - method
extension TwelveGenreCollectionViewCell {
}
