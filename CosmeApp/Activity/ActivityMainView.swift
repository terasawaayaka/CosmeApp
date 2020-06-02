//
//  ActivityMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

enum ActivityType: String {
    case comment = "コメント"
    case good = "いいね"
    case follow = "フォロー"
}

import PGFramework
protocol ActivityMainViewDelegate: NSObjectProtocol {
    func touchedProfilePageButton(indexPath: IndexPath)
    func touchedPostPageButton()
    func touchedSecondProfileButton(indexPath: IndexPath)
    func touchedSecondPostPageButton()
    func touchedThirdProfileButton()
}
extension ActivityMainViewDelegate {
}
// MARK: - Property
class ActivityMainView: BaseView {
    weak var delegate: ActivityMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
    
    var activityType: ActivityType = ActivityType.comment
    
    var noticeModels: [NoticeModel] = [NoticeModel]()
}
// MARK: - Life cycle
extension ActivityMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        loadTableViewCellFromXib(tableView: tableView, cellName: "ActivityGoodTableViewCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "ActivityCommentTableViewCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "ActivityFollowTableViewCell")
    }
}
// MARK: - Protocol
extension ActivityMainView:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityGoodTableViewCell", for: indexPath) as?
             ActivityGoodTableViewCell else {return UITableViewCell()}
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "ActivityCommentTableViewCell", for: indexPath) as?
             ActivityCommentTableViewCell else {return UITableViewCell()}
        guard let thirdCell = tableView.dequeueReusableCell(withIdentifier: "ActivityFollowTableViewCell", for: indexPath) as?
             ActivityFollowTableViewCell else {return UITableViewCell()}
        switch noticeModels[indexPath.row].noticeType {
        case "コメント":
            activityType = .comment
        case "いいね":
            activityType = .good
        case "フォロー":
            activityType = .follow
        default:
            activityType = .comment
        }
        switch activityType {
        case .good:
            cell.updateCell(noticeModel: noticeModels[indexPath.row])
            cell.indexPath = indexPath
            cell.delegate = self
            return cell
        case .comment:
            secondCell.updateCell(noticeModel: noticeModels[indexPath.row])
            secondCell.indexPath = indexPath
            secondCell.delegate = self
            return secondCell
        case .follow:
            thirdCell.delegate = self
            return thirdCell
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            noticeModels.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension ActivityMainView: ActivityGoodTableViewCellDelegate {
    func touchedProfilePageButton(indexPath:IndexPath) {
        if let delegate = delegate {
            delegate.touchedProfilePageButton(indexPath: indexPath)
        }
    }
    func touchedPostPageButton() {
        if let delegate = delegate {
            delegate.touchedPostPageButton()
        }
    }
}

extension ActivityMainView: ActivityCommentTableViewCellDelegate {
    func touchedSecondProfileButton(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.touchedSecondProfileButton(indexPath: indexPath)
        }
    }
    func touchedSecondPostPageButton() {
        if let delegate = delegate {
            delegate.touchedSecondPostPageButton()
        }
    }
}

extension ActivityMainView: ActivityFollowTableViewCellDelegate {
    func touchedThirdProfileButton() {
        if let delegate = delegate {
            delegate.touchedThirdProfileButton()
        }
    }
}

// MARK: - method
extension ActivityMainView {
    func setDelegate() {
        tableView.dataSource = self
    }
    func getModel(noticeModels: [NoticeModel]) {
        self.noticeModels = noticeModels
        tableView.reloadData()
    }
}
