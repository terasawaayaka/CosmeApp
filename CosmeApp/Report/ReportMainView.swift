//
//  ReportMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/10.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportMainViewDelegate: NSObjectProtocol{
    func didSelectRowAt(indexPath: IndexPath)
}
extension ReportMainViewDelegate {
}
// MARK: - Property
class ReportMainView: BaseView {
    weak var delegate: ReportMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
}
// MARK: - Life cycle
extension ReportMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReportTableViewSpamCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReportTableViewSensitiveCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReportTableViewAggressiveCell")
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReportTableViewSuicideCell")
    }
}
// MARK: - Protocol
extension ReportMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewSpamCell", for: indexPath)
            as? ReportTableViewSpamCell else {return UITableViewCell()}
        
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewSensitiveCell", for: indexPath)
            as? ReportTableViewSensitiveCell else {return UITableViewCell()}
        guard let thirdCell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewAggressiveCell", for: indexPath)
            as? ReportTableViewAggressiveCell else {return UITableViewCell()}
        guard let forthCell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewSuicideCell", for: indexPath)
            as? ReportTableViewSuicideCell else {return UITableViewCell()}
        
        switch indexPath.row {
        case 0:
            return cell
        case 1:
            return secondCell
        case 2:
            return thirdCell
        case 3:
            return forthCell
        default:
            return cell
        }
    }
    
}
extension ReportMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectRowAt(indexPath: indexPath)
        }
    }
    
}
// MARK: - method
extension ReportMainView {
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
}

