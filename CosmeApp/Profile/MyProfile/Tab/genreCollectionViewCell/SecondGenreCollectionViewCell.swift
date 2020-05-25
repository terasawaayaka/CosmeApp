//
//  SecondGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SecondGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension SecondGenreCollectionViewCellDelegate {
}
// MARK: - Property
class SecondGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SecondGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension SecondGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SecondGenreCollectionViewCell {
}
// MARK: - method
extension SecondGenreCollectionViewCell {
}
