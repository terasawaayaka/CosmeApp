//
//  SecondYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SecondYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension SecondYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class SecondYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SecondYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension SecondYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SecondYourGenreCollectionViewCell {
}
// MARK: - method
extension SecondYourGenreCollectionViewCell {
}
