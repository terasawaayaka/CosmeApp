//
//  ReviewDetailMainTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReviewDetailMainTableViewCellDelegate: NSObjectProtocol{
    func iconViewButton()
}
extension ReviewDetailMainTableViewCellDelegate {
}
// MARK: - Property
class ReviewDetailMainTableViewCell: BaseTableViewCell {
    weak var delegate: ReviewDetailMainTableViewCellDelegate? = nil
    @IBOutlet weak var iconView: UIButton!
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.iconViewButton()}
    }
}
// MARK: - Life cycle
extension ReviewDetailMainTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension ReviewDetailMainTableViewCell {
}
// MARK: - method
extension ReviewDetailMainTableViewCell {
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
}
