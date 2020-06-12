//
//  ReportTableViewSuicideCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/11.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportTableViewSuicideCellDelegate: NSObjectProtocol{
}
extension ReportTableViewSuicideCellDelegate {
}
// MARK: - Property
class ReportTableViewSuicideCell: BaseTableViewCell {
    weak var delegate: ReportTableViewSuicideCellDelegate? = nil
}
// MARK: - Life cycle
extension ReportTableViewSuicideCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportTableViewSuicideCell {
}
// MARK: - method
extension ReportTableViewSuicideCell {
}

