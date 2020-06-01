//
//  ReviewDetailMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
import FirebaseAuth

protocol ReviewDetailMainViewDelegate: NSObjectProtocol{
    func touchedIconViewButton()
    func iconViewButton2()
    func commentSendButton()
}
extension ReviewDetailMainViewDelegate {
}
// MARK: - Property
class ReviewDetailMainView: BaseView, UIScrollViewDelegate {
    weak var delegate: ReviewDetailMainViewDelegate? = nil
    
    //star
    @IBOutlet weak var firstStarImage: UIImageView!
    @IBOutlet weak var secondStarImage: UIImageView!
    @IBOutlet weak var thirdStarImage: UIImageView!
    @IBOutlet weak var fourthStarImage: UIImageView!
    @IBOutlet weak var fifthStarImage: UIImageView!
    
    //image
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    //review
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var reviewLabel: UITextView!
    @IBOutlet weak var tagLabel: UILabel!
    
    var commentPostModels : [CommentPostModel]=[CommentPostModel]()
    var commentPostModel : CommentPostModel = CommentPostModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconView: UIButton!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    //button
    @IBAction func iconViewButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.iconViewButton2()}
    }
    @IBAction func commentSendButton(_ sender: UIButton) {
        if let delegate = delegate {delegate.commentSendButton()}
        
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
        return commentPostModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewDetailMainTableViewCell")as? ReviewDetailMainTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        cell.updateCell(commentPostModel:commentPostModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete{
            print("削除")
            commentPostModels.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
    func commentGetModel(commentPostModels:[CommentPostModel]){
        self.commentPostModels = commentPostModels
        tableView.reloadData()
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
