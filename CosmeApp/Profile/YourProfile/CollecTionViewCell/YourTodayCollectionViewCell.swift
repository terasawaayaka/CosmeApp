//
//  YourTodayCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourTodayCollectionViewCellDelegate: NSObjectProtocol{
}
extension YourTodayCollectionViewCellDelegate {
}
// MARK: - Property
class YourTodayCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: YourTodayCollectionViewCellDelegate? = nil
    @IBOutlet weak var roundView: UIView!
}
// MARK: - Life cycle
extension YourTodayCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension YourTodayCollectionViewCell {
}
// MARK: - method
extension YourTodayCollectionViewCell {
    func setLayout() {
        roundView.layer.cornerRadius = roundView.frame.height / 2
    }
}
