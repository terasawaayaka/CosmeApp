//
//  EditReviewMainView.swift
//  CosmeApp
//
//  Created by ASW-研修１ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit

import PGFramework
protocol EditReviewMainViewDelegate: NSObjectProtocol{
}

extension EditReviewMainViewDelegate {
}
// MARK: - Property
class EditReviewMainView: BaseView {
    weak var delegate: EditReviewMainViewDelegate? = nil
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewLabel: UILabel!
    
}
// MARK: - Life cycle
extension EditReviewMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension EditReviewMainView {
    
}
// MARK: - method
extension EditReviewMainView {
}
