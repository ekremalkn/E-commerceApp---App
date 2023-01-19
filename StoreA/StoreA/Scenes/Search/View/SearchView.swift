//
//  SearchView.swift
//  StoreA
//
//  Created by Ekrem Alkan on 5.01.2023.
//

import UIKit
import SnapKit

final class SearchView: UIView {
    deinit {
        print("deinit searchview")
    }
    
    var searchController = CustomSearchController(searchPlaceHolder: "Search Products", showsBookmarkButton: true)
    lazy var searchResultsLabel = CustomLabel(text: "Results for SearchTextField", numberOfLines: 0, font: .boldSystemFont(ofSize: 15), textColor: .black, textAlignment: .left)
    lazy var searchResultCountLabel = CustomLabel(text: "", numberOfLines: 1, font: .boldSystemFont(ofSize: 15), textColor: .black, textAlignment: .right)
    lazy var searchResultLabelsStackView = CustomStackView(axis: .horizontal, distiribution: .fillEqually, spacing: 0, isHidden: true)
    var searchCollection = CustomCollection(backgroundColor: .systemGray6, showsScrollIndicator: false, paging: false, layout: UICollectionViewFlowLayout(), scrollDirection: .vertical)
    
    //MARK: - Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        configureSearchBar()
        addSubview()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(searchText: String, count: Int) {
        searchResultsLabel.text = "Results for '\(searchText)'"
        searchResultCountLabel.text = "\(count) founds"
    }
    
    
    //MARK: - Configure SearchBar
    
    private func configureSearchBar() {
        searchController.searchBar.setImage(UIImage(systemName: "slider.horizontal.3"), for: .bookmark, state: .normal)
    }
    
    //MARK: - AddSearchResultLabelsToStackView
    
    private func addSearchResultLabelsToStackView() {
        searchResultLabelsStackView.addArrangedSubviews(searchResultsLabel, searchResultCountLabel)
    }
    
}

extension SearchView {
    
    //MARK: - AddSubview
    
    private func addSubview() {
        addSubviews(searchController.searchBar, searchResultLabelsStackView, searchCollection)
        addSearchResultLabelsToStackView()
    }
    
    //MARK: - SetupConstraints
    
    private func setupConstraint() {
        searchLabelStackViewConstraints()
        searchCollectionConsraints()
    }
    
    //MARK: - UI Elements Constraints
    
    private func searchLabelStackViewConstraints()  {
        searchResultLabelsStackView.snp.makeConstraints { make in
            make.height.equalTo(searchResultCountLabel.snp.height)
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func searchCollectionConsraints() {
        searchCollection.snp.makeConstraints { make in
            make.top.equalTo(searchResultLabelsStackView.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-15)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
    
    
}
