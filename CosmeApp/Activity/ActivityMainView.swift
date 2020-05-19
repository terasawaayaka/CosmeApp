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
    func didSelectRowAt()
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
        
        return cell
    }
}

extension ActivityMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectRowAt()
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
