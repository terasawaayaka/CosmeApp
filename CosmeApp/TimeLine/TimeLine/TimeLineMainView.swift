//
//  TimeLineMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainViewDelegate: NSObjectProtocol{
}
extension TimeLineMainViewDelegate {
}
// MARK: - Property
class TimeLineMainView: baseView {
    weak var delegate: TimeLineMainViewDelegate? = nil
}
// MARK: - Life cycle
extension TimeLineMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension TimeLineMainView {
}
// MARK: - method
extension TimeLineMainView {
}
