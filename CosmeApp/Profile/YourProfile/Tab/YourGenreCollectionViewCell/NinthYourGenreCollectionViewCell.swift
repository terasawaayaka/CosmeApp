//
//  NinthYourGenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol NinthYourGenreCollectionViewCellDelegate: NSObjectProtocol{
}
extension NinthYourGenreCollectionViewCellDelegate {
}
// MARK: - Property
class NinthYourGenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: NinthYourGenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension NinthYourGenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension NinthYourGenreCollectionViewCell {
}
// MARK: - method
extension NinthYourGenreCollectionViewCell {
}
