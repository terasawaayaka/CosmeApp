//
//  TimeLineMainTableViewSecondCell.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainTableViewSecondCellDelegate: NSObjectProtocol{
    func iconViewButton()
}
extension TimeLineMainTableViewSecondCellDelegate {
}
// MARK: - Property
class TimeLineMainTableViewSecondCell: BaseTableViewCell, UIScrollViewDelegate {
    weak var delegate: TimeLineMainTableViewSecondCellDelegate? = nil

    @IBOutlet weak var iconView: UIButton!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate{delegate.iconViewButton()}
    }
}
// MARK: - Life cycle
extension TimeLineMainTableViewSecondCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        setDelegate()
        scrollViewDidEndDecelerating(imageScrollView)
    }
}
// MARK: - Protocol
extension TimeLineMainTableViewSecondCell {
}
// MARK: - method
extension TimeLineMainTableViewSecondCell {
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
    func setDelegate(){
        imageScrollView.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if fmod(imageScrollView.contentOffset.x, imageScrollView.frame.maxX) == 0 {
        pageControl.currentPage = Int(scrollView.contentOffset.x / imageScrollView.frame.maxX)
        }
    }
}
