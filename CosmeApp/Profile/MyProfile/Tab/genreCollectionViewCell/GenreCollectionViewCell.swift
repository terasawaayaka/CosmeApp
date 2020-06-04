//
//  GenreCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol GenreCollectionViewCellDelegate: NSObjectProtocol{

}
extension GenreCollectionViewCellDelegate {
}
// MARK: - Property
class GenreCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: GenreCollectionViewCellDelegate? = nil
}
// MARK: - Life cycle
extension GenreCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension GenreCollectionViewCell {
}
// MARK: - method
extension GenreCollectionViewCell {
}
