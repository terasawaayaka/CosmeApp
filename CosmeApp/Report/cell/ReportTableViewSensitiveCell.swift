//
//  ReportTableViewSensitiveCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/11.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportTableViewSensitiveCellDelegate: NSObjectProtocol{
}
extension ReportTableViewSensitiveCellDelegate {
}
// MARK: - Property
class ReportTableViewSensitiveCell: BaseTableViewCell {
    weak var delegate: ReportTableViewSensitiveCellDelegate? = nil
}
// MARK: - Life cycle
extension ReportTableViewSensitiveCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportTableViewSensitiveCell {
}
// MARK: - method
extension ReportTableViewSensitiveCell {
}

