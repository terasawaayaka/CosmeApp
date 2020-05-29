//
//  ElevenGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/29.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ElevenGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension ElevenGenreCollectionViewCellDelegate {
}
// MARK: - Property
class ElevenGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ElevenGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ElevenGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ElevenGenreCollectionViewCell {
}
// MARK: - method
extension ElevenGenreCollectionViewCell {
}
