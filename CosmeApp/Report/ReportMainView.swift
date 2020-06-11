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
        
        loadTableViewCellFromXib(tableView: tableView, cellName: "ReportTableViewCell")
    }
}
// MARK: - Protocol
extension ReportMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewCell", for: indexPath)
            as? ReportTableViewCell else {return UITableViewCell()}; return cell
    }
    
}
// MARK: - method
extension ReportMainView {
    func setDelegate(){
        tableView.dataSource = self
    }
}

