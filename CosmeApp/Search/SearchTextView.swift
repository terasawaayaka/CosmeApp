//
//  SearchTextView.swift
//  CosmeApp
//
//  Created by ASW-研修３ on 2020/05/15.
//  Copyright © 2020 ASW-研修２. All rights reserved.
//

import UIKit
import PGFramework
protocol SearchTextViewDelegate: NSObjectProtocol{
    func searchBarCancelButtonClicked()
    func searchBarSearchButtonClicked(text: String)
}
extension SearchTextViewDelegate {
}
// MARK: - Property
class SearchTextView: BaseView, UISearchBarDelegate {
    weak var delegate: SearchTextViewDelegate? = nil
    @IBOutlet weak var searchBar: UISearchBar!

}
// MARK: - Life cycle
extension SearchTextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setSearchBar()
    }
}
// MARK: - Protocol
extension SearchTextView {
}
// MARK: - method
extension SearchTextView {
    func setSearchBar(){
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.showsBookmarkButton = false
        searchBar.showsSearchResultsButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let delegate = delegate {
            delegate.searchBarCancelButtonClicked() }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let delegate = delegate {
            if let text = searchBar.text {
                delegate.searchBarSearchButtonClicked(text: text)
            }
        }
    }
    
}

