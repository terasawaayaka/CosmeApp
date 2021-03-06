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
import FirebaseAuth

protocol ActivityMainViewDelegate: NSObjectProtocol {
    func touchedProfilePageButton(indexPath: IndexPath)
    func touchedPostPageButton(indexPath: IndexPath)
    func touchedSecondProfileButton(indexPath: IndexPath)
    func touchedSecondPostPageButton(indexPath: IndexPath)
    func touchedThirdProfileButton(indexPath: IndexPath)
    func didSelectRowAt(indexPath: IndexPath)
    func deleteCell(indexPath: IndexPath)
}
extension ActivityMainViewDelegate {
}
// MARK: - Property
class ActivityMainView: BaseView {
    weak var delegate: ActivityMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
    
    var activityType: ActivityType = ActivityType.comment
    
    var noticeModels: [NoticeModel] = [NoticeModel]()
    var noticeModel: NoticeModel = NoticeModel()
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
            thirdCell.updateCell(noticeModel: noticeModels[indexPath.row])
            thirdCell.indexPath = indexPath
            thirdCell.delegate = self
            return thirdCell
        default:
            break
        }
    }
    
}

extension ActivityMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //dataを消す
        noticeModels.remove(at: indexPath.row)
        if let delegate = delegate {
            delegate.deleteCell(indexPath: indexPath)
        }
        //tableViewCellの削除
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }

}

extension ActivityMainView: ActivityGoodTableViewCellDelegate {
    func touchedProfilePageButton(indexPath:IndexPath) {
        if let delegate = delegate {
            delegate.touchedProfilePageButton(indexPath: indexPath)
        }
    }
    func touchedPostPageButton(indexPath:IndexPath) {
        if let delegate = delegate {
            delegate.touchedPostPageButton(indexPath: indexPath)
        }
    }
}

extension ActivityMainView: ActivityCommentTableViewCellDelegate {
    func touchedSecondProfileButton(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.touchedSecondProfileButton(indexPath: indexPath)
        }
    }
    func touchedSecondPostPageButton(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.touchedSecondPostPageButton(indexPath: indexPath)
        }
    }
}

extension ActivityMainView: ActivityFollowTableViewCellDelegate {
    func touchedThirdProfileButton(indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.touchedThirdProfileButton(indexPath: indexPath)
        }
    }
}

// MARK: - method
extension ActivityMainView {
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getModel(noticeModels: [NoticeModel]) {
        self.noticeModels = noticeModels
        tableView.reloadData()
    }
}
