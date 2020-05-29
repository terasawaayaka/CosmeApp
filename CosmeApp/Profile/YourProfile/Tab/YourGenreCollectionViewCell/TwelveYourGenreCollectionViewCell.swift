//
//  TwelveYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/29.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TwelveYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension TwelveYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class TwelveYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TwelveYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension TwelveYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TwelveYourGenreCollectionViewCell {
}
// MARK: - method
extension TwelveYourGenreCollectionViewCell {
}
