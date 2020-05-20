//
//  SearchResultMainView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchResultMainViewDelegate: NSObjectProtocol{
    func touchedEyeShadowButton()
    func touchedEyeLinerButton()
    func touchedMascaraButton()
    func touchedColorContctButton()
    func touchedEyeBrowButton()
    func touchedBaseButton()
    func touchedHiLightButton()
    func touchedShadingButton()
    func touchedCheekButton()
    func touchedSkinCareButton()
    func touchedLipButton()
    func touchedHairCareButton()
}
extension SearchResultMainViewDelegate {
}
// MARK: - Property
class SearchResultMainView: BaseView {
    weak var delegate: SearchResultMainViewDelegate? = nil
    @IBAction func touchedEyeShadowButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedEyeShadowButton()}
    }

    @IBAction func touchedEyeLinerButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedEyeLinerButton()}
    }
    
    @IBAction func touchedMascaraButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedMascaraButton()}
    }
    @IBAction func touchedColorContctButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedColorContctButton()}
    }
    @IBAction func touchedEyeBrowButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedEyeBrowButton()}
    }
    @IBAction func touchedBaseButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedBaseButton()}
    }
    @IBAction func touchedHiLightButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedHiLightButton()}
    }
    @IBAction func touchedShadingButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedShadingButton()}
    }
    @IBAction func touchedCheekButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedCheekButton()}
    }
    @IBAction func touchedSkinCareButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedSkinCareButton()}
    }
    @IBAction func touchedLipButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedLipButton()}
    }
    @IBAction func touchedHairCareButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedHairCareButton()}
    }
}
// MARK: - Life cycle
extension SearchResultMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Protocol
extension SearchResultMainView {
}
// MARK: - method
extension SearchResultMainView {
}

