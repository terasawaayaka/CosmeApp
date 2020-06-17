//
//  ReportDoneMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/06/12.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol ReportDoneMainViewDelegate: NSObjectProtocol{
    func reportButton()
}
extension ReportDoneMainViewDelegate {
    
}
// MARK: - Property
class ReportDoneMainView: BaseView {
    weak var delegate: ReportDoneMainViewDelegate? = nil
    @IBAction func reportButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.reportButton() }
    }
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var reportLabel: UILabel!

}
// MARK: - Life cycle
extension ReportDoneMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
// MARK: - Protocol
extension ReportDoneMainView {
}
// MARK: - method
extension ReportDoneMainView {
    func setLayout(){
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0.001440257174, blue: 0.1491909898, alpha: 1)
    }
    
}

