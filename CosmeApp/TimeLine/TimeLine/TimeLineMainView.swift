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
    
    func didSelectRowAt(indexPath:IndexPath)
    func didSelectCollectionViewCell(indexPath:IndexPath)
    func touchedIconViewButton(reviewPostModel:ReviewPostModel)
}
extension TimeLineMainViewDelegate {
}
// MARK: - Property
class TimeLineMainView: BaseView {
    weak var delegate: TimeLineMainViewDelegate? = nil
    
    var reviewPostModels : [ReviewPostModel] = [ReviewPostModel]()
    var makePostModels : [MakePostModel] = [MakePostModel]()

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
        return reviewPostModels.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineMainTableViewCell" ) as? TimeLineMainTableViewCell else {return UITableViewCell()}
        
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "TimeLineMainTableViewSecondCell")as? TimeLineMainTableViewSecondCell else {return UITableViewCell()}
        switch indexPath.row {
        case 0:
            cell.delegate = self
            cell.updateCell(makePostModels:makePostModels)
            return cell
        default:
            secondCell.delegate = self
            secondCell.updateCell(reviewPostModel: reviewPostModels[indexPath.row - 1])
            return secondCell
        }
    }
}

extension TimeLineMainView :UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{delegate.didSelectRowAt(indexPath: indexPath)}
    }
}

extension TimeLineMainView:TimeLineMainTableViewCellDelegate {
    func didSelectItemAt(indexPath: IndexPath) {
        if let delegate = delegate {delegate.didSelectCollectionViewCell(indexPath: indexPath)}
    }
}

extension TimeLineMainView:TimeLineMainTableViewSecondCellDelegate {
    func iconViewButton(reviewPostModel: ReviewPostModel) {
        if let delegate = delegate {delegate.touchedIconViewButton(reviewPostModel: reviewPostModel)}
    }
}
// MARK: - method
extension TimeLineMainView {
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    func reviewGetModel(reviewPostModels:[ReviewPostModel]){
        self.reviewPostModels = reviewPostModels
        tableView.reloadData()
    }
    func makeGetModel(makePostModels:[MakePostModel]){
        self.makePostModels = makePostModels
        tableView.reloadData()
    }
}
