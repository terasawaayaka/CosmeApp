//
//  SearchUserResultTableViewCell.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchUserResultTableViewCellDelegate: NSObjectProtocol{
}
extension SearchUserResultTableViewCellDelegate {
}
// MARK: - Property
class SearchUserResultTableViewCell: BaseTableViewCell {
    weak var delegate: SearchUserResultTableViewCellDelegate? = nil
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
}
// MARK: - Life cycle
extension SearchUserResultTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension SearchUserResultTableViewCell {
}
// MARK: - method
extension SearchUserResultTableViewCell {
    func setLayout(){
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
}

