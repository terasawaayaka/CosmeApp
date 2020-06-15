//
//  ReportedMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/12.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportedMainViewDelegate: NSObjectProtocol{
    func reportCompleteButton()
}
extension ReportedMainViewDelegate {
}
// MARK: - Property
class ReportedMainView: BaseView {
    weak var delegate: ReportedMainViewDelegate? = nil
    @IBAction func reportCompleteButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.reportCompleteButton()
        }
    }
}
// MARK: - Life cycle
extension ReportedMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ReportedMainView {
}
// MARK: - method
extension ReportedMainView {
}

