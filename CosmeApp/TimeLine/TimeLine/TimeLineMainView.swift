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
    func didSelectRowAt()
    func didSelectCollectionViewCell()
    func touchedIconViewButton()
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
            cell.delegate = self
            return cell
        default:
            secondCell.delegate = self
            return secondCell
        }
    }
}

extension TimeLineMainView :UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectRowAt()}
    }
}

extension TimeLineMainView:TimeLineMainTableViewCellDelegate{
    func didSelectItemAt() {
        if let delegate = delegate {delegate.didSelectCollectionViewCell()}
    }
}

extension TimeLineMainView:TimeLineMainTableViewSecondCellDelegate{
    func iconViewButton() {
        if let delegate = delegate {delegate.touchedIconViewButton()}
    }
    
    
}
// MARK: - method
extension TimeLineMainView {
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
