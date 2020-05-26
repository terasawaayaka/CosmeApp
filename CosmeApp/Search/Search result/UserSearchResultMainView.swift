//
//  UserSearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol UserSearchResultMainViewDelegate: NSObjectProtocol{
    func touchedUserCellButton()
}
extension UserSearchResultMainViewDelegate {
}
// MARK: - Property
class UserSearchResultMainView: BaseView {
    weak var delegate: UserSearchResultMainViewDelegate? = nil
    @IBOutlet weak var userTableView: UITableView!
    
    var userModels: [UserModel] = [UserModel]()
}
// MARK: - Life cycle
extension UserSearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: userTableView, cellName: "SearchUserResultTableViewCell")
    }
}
// MARK: - Protocol
extension UserSearchResultMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchUserResultTableViewCell", for: indexPath)as? SearchUserResultTableViewCell else {return UITableViewCell()}
        cell.delegate = self
        cell.updateCell(userModel: userModels[indexPath.row])
        return cell
    }
}
extension UserSearchResultMainView: SearchUserResultTableViewCellDelegate {
    func touchedUserButton() {
        if let delegate = delegate {
            delegate.touchedUserCellButton()}
    }
}
// MARK: - method
extension UserSearchResultMainView {
    func setDelegate(){
        userTableView.dataSource = self
    }
    func getModel(userModels: [UserModel]){
        self.userModels = userModels
        userTableView.reloadData()
    }
}

