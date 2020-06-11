//
//  ReportTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/11.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportTableViewCellDelegate: NSObjectProtocol{
}
extension ReportTableViewCellDelegate {
}
// MARK: - Property
class ReportTableViewCell: BaseTableViewCell {
    weak var delegate: ReportTableViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ReportTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportTableViewCell {
}
// MARK: - method
extension ReportTableViewCell {
}

