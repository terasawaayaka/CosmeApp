//
//  ActivityMainView.swift
//  CosmeApp
//
//  Created by ASW-研修２ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol ActivityMainViewDelegate: NSObjectProtocol {
    func didSelectRowAt(indexPath:IndexPath)
}
extension ActivityMainViewDelegate {
}
// MARK: - Property
class ActivityMainView: BaseView {
    weak var delegate: ActivityMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityGoodTableViewCell", for: indexPath) as?
             ActivityGoodTableViewCell else {return UITableViewCell()}
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "ActivityCommentTableViewCell", for: indexPath) as?
             ActivityCommentTableViewCell else {return UITableViewCell()}
        guard let thirdCell = tableView.dequeueReusableCell(withIdentifier: "ActivityFollowTableViewCell", for: indexPath) as?
             ActivityFollowTableViewCell else {return UITableViewCell()}
        switch indexPath {
        case [0,0]:
            //cell.delegate = self
            return cell
        case [0,1]:
            //secondCell.delegate = self
            return secondCell
        case [0,2]:
            //thirdCell.delegate = self
            return thirdCell
        default:
            return cell
        }
    }
}

extension ActivityMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectRowAt(indexPath: indexPath)
        }
    }
}

// MARK: - method
extension ActivityMainView {
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}
