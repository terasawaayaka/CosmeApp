//
//  UserSearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol UserSearchResultMainViewDelegate: NSObjectProtocol{
}
extension UserSearchResultMainViewDelegate {
}
// MARK: - Property
class UserSearchResultMainView: BaseView {
    weak var delegate: UserSearchResultMainViewDelegate? = nil
}
// MARK: - Life cycle
extension UserSearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension UserSearchResultMainView {
}
// MARK: - method
extension UserSearchResultMainView {
}

