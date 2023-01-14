//
//  SpecialProductsView.swift
//  StoreA
//
//  Created by Ekrem Alkan on 14.01.2023.
//

import UIKit

final class SpecialProductsView: UIView {
    
    deinit {
        print("deinit SpecialProductsView")
    }

    
    let specialProductsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray6
        collection.showsVerticalScrollIndicator = false
        collection.isPagingEnabled = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    //MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension SpecialProductsView {
    
    //MARK: - AddSubview
    
    private func addSubview() {
        addSubview(specialProductsCollection)
    }
    
    //MARK: - SetupConstraints
    
    private func setupConstraints() {
        specialProductsCollectionConstraints()
    }
    
    //MARK: - UI Elements Constraints
    
    private func specialProductsCollectionConstraints() {
        specialProductsCollection.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }



}