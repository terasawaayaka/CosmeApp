//
//  YourPostCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourPostCollectionViewCellDelegate: NSObjectProtocol{
}
extension YourPostCollectionViewCellDelegate {
}
// MARK: - Property
class YourPostCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: YourPostCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension YourPostCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourPostCollectionViewCell {
}
// MARK: - method
extension YourPostCollectionViewCell {
}
