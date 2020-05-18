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
    @IBOutlet weak var roundView: UIView!
}
// MARK: - Life cycle
extension TodayCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension TodayCollectionViewCell {
}
// MARK: - method
extension TodayCollectionViewCell {
    func setLayout() {
        roundView.layer.cornerRadius = roundView.frame.height / 2
    }
}
