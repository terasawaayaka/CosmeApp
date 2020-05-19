//
//  GoodCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol GoodCollectionViewCellDelegate: NSObjectProtocol{
}
extension GoodCollectionViewCellDelegate {
}
// MARK: - Property
class GoodCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: GoodCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension GoodCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension GoodCollectionViewCell {
}
// MARK: - method
extension GoodCollectionViewCell {
}
