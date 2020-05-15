//
//  SearchTextView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchTextViewDelegate: NSObjectProtocol{
}
extension SearchTextViewDelegate {
}
// MARK: - Property
class SearchTextView: BaseView {
    weak var delegate: SearchTextViewDelegate? = nil
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
}
// MARK: - Life cycle
extension SearchTextView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SearchTextView {
}
// MARK: - method
extension SearchTextView {
}

