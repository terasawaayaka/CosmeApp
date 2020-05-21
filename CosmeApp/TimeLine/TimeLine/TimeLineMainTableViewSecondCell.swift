//
//  TimeLineMainTableViewSecondCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainTableViewSecondCellDelegate: NSObjectProtocol{
}
extension TimeLineMainTableViewSecondCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewSecondCell: BaseTableViewCell {
    weak var delegate: TimeLineMainTableViewSecondCellDelegate? = nil

    @IBOutlet weak var iconView: UIButton!
}
// MARK: - Life cycle
extension TimeLineMainTableViewSecondCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewSecondCell {
}
// MARK: - method
extension TimeLineMainTableViewSecondCell {
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
}
