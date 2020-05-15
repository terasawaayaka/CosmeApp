//
//  TimeLineMainTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainTableViewCellDelegate: NSObjectProtocol{
}
extension TimeLineMainTableViewCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewCell: BaseTableViewCell {
    weak var delegate: TimeLineMainTableViewCellDelegate? = nil
}
// MARK: - Life cycle
extension TimeLineMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewCell {
}
// MARK: - method
extension TimeLineMainTableViewCell {
}
