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
}
extension FollowMainViewDelegate {
}
// MARK: - Property
class FollowMainView: BaseView {
    weak var delegate: FollowMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTableViewCell", for: indexPath) as? FollowTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}
// MARK: - method
extension FollowMainView {
    func setDelegate() {
        tableView.dataSource = self
    }
}
