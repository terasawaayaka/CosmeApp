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
}
extension UserSearchResultMainViewDelegate {
}
// MARK: - Property
class UserSearchResultMainView: BaseView {
    weak var delegate: UserSearchResultMainViewDelegate? = nil
    @IBOutlet weak var userTableView: UITableView!
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchUserResultTableViewCell", for: indexPath)as? SearchUserResultTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}
// MARK: - method
extension UserSearchResultMainView {
    func setDelegate(){
        userTableView.dataSource = self
    }
}

