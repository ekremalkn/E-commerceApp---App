//
//  SearchController.swift
//  StoreA
//
//  Created by Ekrem Alkan on 5.01.2023.
//

import UIKit

final class SearchController: UIViewController {
    deinit {
        print("deinit searchcontroller")
    }

    //MARK: - Properties
    private let searchViewModel = SearchViewModel()
    private let searchView = SearchView()
    private weak var searchController: UISearchController? {
        return searchView.searchController
    }
    private weak var searchBar: UISearchBar? {
        return searchView.searchController.searchBar
    }
    
    var filteredProducts: [Product] = []
    
    var isSearchBarEmpty: Bool {
        return searchBar?.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        collectionCellRegister()
        setupDelegates()
        searchViewModel.fetchAllProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Configure ViewController
    
    private func configureViewController() {
        view = searchView
        navigationItem.searchController = searchController
    }
    
    //MARK: - FilterForSearchText
    
    private func filterForSearchText(_ searchText: String) {
            if isSearchBarEmpty {
                searchView.searchResultLabelsStackView.isHidden = true
            } else {
                filteredProducts = searchViewModel.allProducts.filter { Product in
                    Product.title!.lowercased().contains(searchText.lowercased())
                }
                searchView.searchResultLabelsStackView.isHidden = false
                searchView.configure(searchText: searchText, count: filteredProducts.count)
                
            }
        searchView.searchCollection.reloadData()
    }

    
    //MARK: - Register Custom Cell

    private func collectionCellRegister() {
        searchView.searchCollection.register(ProductCollectionCell.self, forCellWithReuseIdentifier: "ProductCollectionCell")
    }
    
    //MARK: - Setup Delegates
    
    private func setupDelegates() {
        searchViewModel.delegate = self
        
        searchBar?.delegate = self
        searchController?.searchResultsUpdater = self
        
        searchView.searchCollection.delegate = self
        searchView.searchCollection.dataSource = self
    }
    

    
}

//MARK: - SearchBar Methods

extension SearchController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchBar?.text else { return }
        filterForSearchText(searchText)
    }
  
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("category filter")
    }
    

}

//MARK: - CollectionViewMethods

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearchBarEmpty {
            return searchViewModel.allProducts.count
        } else {
            return filteredProducts.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchView.searchCollection.dequeueReusableCell(withReuseIdentifier: "ProductCollectionCell", for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell()}
        if isSearchBarEmpty {
            cell.configure(data: searchViewModel.allProducts[indexPath.row])
            return cell
        } else {
            cell.configure(data: filteredProducts[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchView.searchCollection.frame.width / 2 - 10, height: searchView.searchCollection.frame.height / 3 )

    }
}

//MARK: - SearchViewModelDelegate

extension SearchController: SearchViewModelDelegate {
    func didOccurError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func didFetchFilteredItemsSuccessful() {
        searchView.searchCollection.reloadData()

    }
    
    
}


