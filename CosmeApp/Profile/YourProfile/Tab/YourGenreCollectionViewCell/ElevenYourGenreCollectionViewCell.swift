//
//  ElevenYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/29.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ElevenYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension ElevenYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class ElevenYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ElevenYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ElevenYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ElevenYourGenreCollectionViewCell {
}
// MARK: - method
extension ElevenYourGenreCollectionViewCell {
}
