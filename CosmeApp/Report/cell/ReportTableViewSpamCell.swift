//
//  ReportTableViewSpamCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/11.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportTableViewSpamCellDelegate: NSObjectProtocol{
}
extension ReportTableViewSpamCellDelegate {
}
// MARK: - Property
class ReportTableViewSpamCell: BaseTableViewCell {
    weak var delegate: ReportTableViewSpamCellDelegate? = nil
}
// MARK: - Life cycle
extension ReportTableViewSpamCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportTableViewSpamCell {
}
// MARK: - method
extension ReportTableViewSpamCell {
}

