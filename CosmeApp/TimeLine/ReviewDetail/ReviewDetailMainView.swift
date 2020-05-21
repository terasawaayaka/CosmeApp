//
//  ReviewDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework

protocol ReviewDetailMainViewDelegate: NSObjectProtocol{
    func touchedIconViewButton()
    func iconViewButton2()
}
extension ReviewDetailMainViewDelegate {
}
// MARK: - Property
class ReviewDetailMainView: BaseView, UIScrollViewDelegate {
    weak var delegate: ReviewDetailMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconView: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.iconViewButton2()}
    }
    @IBAction func commentSendButton(_ sender: UIButton) {
        commentTextField.endEditing(true)
        commentTextField.text = ""
    }
}
// MARK: - Life cycle
extension ReviewDetailMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        setLayout()
        scrollViewDidEndDecelerating(imageScrollView)
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReviewDetailMainTableViewCell")
    }
}
// MARK: - Protocol
extension ReviewDetailMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewDetailMainTableViewCell")as? ReviewDetailMainTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        return cell
    }
}

extension ReviewDetailMainView:ReviewDetailMainTableViewCellDelegate{
    func iconViewButton() {
        if let delegate = delegate {delegate.touchedIconViewButton()}
    }
    
    
}
// MARK: - method
extension ReviewDetailMainView {
    func setDelegate(){
        tableView.dataSource = self
        imageScrollView.delegate = self
    }
    func setLayout(){
        iconView.layer.cornerRadius = iconView.frame.width / 2
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if fmod(imageScrollView.contentOffset.x, imageScrollView.frame.maxX) == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / imageScrollView.frame.maxX)
        }
    }
}
