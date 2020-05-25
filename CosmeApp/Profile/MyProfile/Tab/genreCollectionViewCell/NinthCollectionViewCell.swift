//
//  NinthCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol NinthCollectionViewCellDelegate: NSObjectProtocol{
}
extension NinthCollectionViewCellDelegate {
}
// MARK: - Property
class NinthCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: NinthCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension NinthCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension NinthCollectionViewCell {
}
// MARK: - method
extension NinthCollectionViewCell {
}
