//
//  YourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension YourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class YourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: YourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension YourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourGenreCollectionViewCell {
}
// MARK: - method
extension YourGenreCollectionViewCell {
}
