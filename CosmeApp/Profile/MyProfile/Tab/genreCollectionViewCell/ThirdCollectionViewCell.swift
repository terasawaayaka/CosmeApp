//
//  ThirdCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ThirdCollectionViewCellDelegate: NSObjectProtocol{
}
extension ThirdCollectionViewCellDelegate {
}
// MARK: - Property
class ThirdCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ThirdCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ThirdCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ThirdCollectionViewCell {
}
// MARK: - method
extension ThirdCollectionViewCell {
}
