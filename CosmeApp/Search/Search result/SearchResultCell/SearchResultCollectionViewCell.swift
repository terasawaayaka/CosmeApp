//
//  SearchResultCollectionViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchResultCollectionViewCellDelegate: NSObjectProtocol{
}
extension SearchResultCollectionViewCellDelegate {
}
// MARK: - Property
class SearchResultCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: SearchResultCollectionViewCellDelegate? = nil
    @IBOutlet weak var imaveView: UIImageView!
    @IBOutlet weak var productNameLabel: NSLayoutConstraint!
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
}
// MARK: - Life cycle
extension SearchResultCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCell()
    }
}
// MARK: - Protocol
extension SearchResultCollectionViewCell {
}
// MARK: - method
extension SearchResultCollectionViewCell {
    func updateCell(){
        let cellWidthConstant = UIScreen.main.bounds.size.width - 40
        cellWidth.constant = cellWidthConstant / 3
    }
}

