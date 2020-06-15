//
//  ReportTableViewAggressiveCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/11.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportTableViewAggressiveCellDelegate: NSObjectProtocol{
}
extension ReportTableViewAggressiveCellDelegate {
}
// MARK: - Property
class ReportTableViewAggressiveCell: BaseTableViewCell {
    weak var delegate: ReportTableViewAggressiveCellDelegate? = nil
}
// MARK: - Life cycle
extension ReportTableViewAggressiveCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportTableViewAggressiveCell {
}
// MARK: - method
extension ReportTableViewAggressiveCell {
}

