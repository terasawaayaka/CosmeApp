//
//  ThirdYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ThirdYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension ThirdYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class ThirdYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: ThirdYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension ThirdYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ThirdYourGenreCollectionViewCell {
}
// MARK: - method
extension ThirdYourGenreCollectionViewCell {
}
