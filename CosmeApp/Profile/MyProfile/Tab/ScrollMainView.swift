//
//  ScrollMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/05/18.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ScrollMainViewDelegate: NSObjectProtocol{
}
extension ScrollMainViewDelegate {
}
// MARK: - Property
class ScrollMainView: BaseView {
    weak var delegate: ScrollMainViewDelegate? = nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var goodMainView: UIView!
    @IBOutlet weak var bookMarkMainView: UIView!
    @IBOutlet weak var genreMainView: UIView!
}
// MARK: - Life cycle
extension ScrollMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension ScrollMainView {
}
// MARK: - method
extension ScrollMainView {
}
