//
//  EighthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol EighthCollectionViewCellDelegate: NSObjectProtocol{
}
extension EighthCollectionViewCellDelegate {
}
// MARK: - Property
class EighthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: EighthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension EighthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EighthCollectionViewCell {
}
// MARK: - method
extension EighthCollectionViewCell {
}
