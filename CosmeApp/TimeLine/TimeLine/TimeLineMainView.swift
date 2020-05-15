//
//  TimeLineMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol TimeLineMainViewDelegate: NSObjectProtocol{
}
extension TimeLineMainViewDelegate {
}
// MARK: - Property
class TimeLineMainView: BaseView {
    weak var delegate: TimeLineMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
}
// MARK: - Life cycle
extension TimeLineMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "TimeLineMainTableViewCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "TimeLineMainTableViewSecondCell")
    }
}
// MARK: - Protocol
extension TimeLineMainView :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineMainTableViewCell") as? TimeLineMainTableViewCell else {return UITableViewCell()}
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "TimeLineMainTableViewSecondCell")as? TimeLineMainTableViewSecondCell else {return UITableViewCell()}
        switch indexPath.row {
        case 0:
            return cell
        default:
            return secondCell
        }
    }
}
// MARK: - method
extension TimeLineMainView {
    func setDelegate(){
        tableView.dataSource = self
    }
    
}
