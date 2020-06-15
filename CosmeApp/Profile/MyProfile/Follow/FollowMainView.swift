//
//  FollowMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/08.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol FollowMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt(indexPath: IndexPath)
}
extension FollowMainViewDelegate {
}
// MARK: - Property
class FollowMainView: BaseView {
    weak var delegate: FollowMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!

    var userModel: UserModel = UserModel()
    var userModels: [UserModel] = [UserModel]()
    var noticeModel: NoticeModel = NoticeModel()
    var noticeModels: [NoticeModel] = [NoticeModel]()
}
// MARK: - Life cycle
extension FollowMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "FollowTableViewCell")
    }
}
// MARK: - Protocol
extension FollowMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTableViewCell", for: indexPath) as? FollowTableViewCell else {return UITableViewCell()}
        cell.updateCell(userModel: userModels[indexPath.row])
        return cell
    }
    
}
extension FollowMainView :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectRowAt(indexPath:indexPath)}
    }
}
// MARK: - method
extension FollowMainView {
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getModel(userModels: [UserModel]){
        self.userModels = userModels
        tableView.reloadData()
    }
}
