//
//  LoadingView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/25.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol LoadingViewDelegate: NSObjectProtocol{
}
extension LoadingViewDelegate {
}
// MARK: - Property
class LoadingView: BaseView {
    weak var delegate: LoadingViewDelegate? = nil
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    func loadNib(){
        let view = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
// MARK: - Life cycle
extension LoadingView {
}
// MARK: - Protocol
extension LoadingView {
}
// MARK: - method
extension LoadingView {
}
