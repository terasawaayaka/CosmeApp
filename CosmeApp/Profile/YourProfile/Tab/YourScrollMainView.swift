//
//  YourScrollMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/20.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourScrollMainViewDelegate: NSObjectProtocol{
}
extension YourScrollMainViewDelegate {
}
// MARK: - Property
class YourScrollMainView: BaseView {
    weak var delegate: YourScrollMainViewDelegate? = nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var yourPostMainView: UIView!
    @IBOutlet weak var yourGenreMainView: UIView!
}
// MARK: - Life cycle
extension YourScrollMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension YourScrollMainView {
}
// MARK: - method
extension YourScrollMainView {
}
