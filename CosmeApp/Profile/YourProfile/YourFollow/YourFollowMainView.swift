//
//  YourFollowMainView.swift
//  CosmeApp
//
//  Created by ASW-研修４ on 2020/06/16.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol YourFollowMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt(indexPath: IndexPath)
}
extension YourFollowMainViewDelegate {
}
// MARK: - Property
class YourFollowMainView: BaseView {
    weak var delegate: YourFollowMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
    
    var userModel: UserModel = UserModel()
    var userModels: [UserModel] = [UserModel]()
}
// MARK: - Life cycle
extension YourFollowMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "YourFollowTableViewCell")
    }
}
// MARK: - Protocol
extension YourFollowMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "YourFollowTableViewCell", for: indexPath) as?
            YourFollowTableViewCell else {return UITableViewCell()}
        cell.updateCell(userModel: userModels[indexPath.row])
        return cell
    }
    
}
extension YourFollowMainView :UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectRowAt(indexPath: indexPath)}
    }
}
// MARK: - method
extension YourFollowMainView {
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getModel(userModels: [UserModel]){
        self.userModels = userModels
        tableView.reloadData()
    }
}
