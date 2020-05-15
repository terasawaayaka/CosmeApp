//
//  TodayCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol TodayCollectionViewCellDelegate: NSObjectProtocol{
}
extension TodayCollectionViewCellDelegate {
}
// MARK: - Property
class TodayCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: TodayCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension TodayCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TodayCollectionViewCell {
}
// MARK: - method
extension TodayCollectionViewCell {
}
