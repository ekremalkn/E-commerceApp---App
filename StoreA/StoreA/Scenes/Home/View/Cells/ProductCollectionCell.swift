//
//  ProductCollectionCell.swift
//  StoreA
//
//  Created by Ekrem Alkan on 3.01.2023.
//

import UIKit

protocol ProductCollectionCellProtocol {
    var productImage: String { get }
    var productTitle: String { get }
    var productRatingCount: String { get }
    var productSalesAmount: String { get }
    var productPrice: String { get }
}

class ProductCollectionCell: UICollectionViewCell {
    deinit {
        print("deinit productcell")
    }
    
    //MARK: - Cell's Identifier
    
    static let identifier = "ProductCollectionCell"
    
    //MARK: - Creating UI Elements
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.backgroundColor = nil
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var ratingCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingCountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var salesAmountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingSalesInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 15
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ConfigureCell
    
    func configure(data: ProductCollectionCellProtocol) {
        productImageView.downloadSetImage(url: data.productImage)
        titleLabel.text = data.productTitle
        ratingCountLabel.text = data.productRatingCount
        salesAmountLabel.text = data.productSalesAmount
        priceLabel.text = data.productPrice
    }

    
    //MARK: - AddButtonToImageView
    
    private func addButtonToImageView() {
        productImageView.addSubview(addButton)
    }
    
    //MARK: - AddRatingElementsToStackView
    
    private func addRatingElementsToStackView() {
        ratingCountStackView.addArrangedSubview(ratingCountImageView)
        ratingCountStackView.addArrangedSubview(ratingCountLabel)
    }
    
    //MARK: - AddRatingSalesInfoToStackView
    
    private func addRatingSalesInfoToStackView() {
        ratingSalesInfoStackView.addArrangedSubview(ratingCountStackView)
        ratingSalesInfoStackView.addArrangedSubview(salesAmountLabel)
    }
    
    //MARK: - AddProductInfoToStackView
    
    private func addProductInfoToStackView() {
        productInfoStackView.addArrangedSubview(titleLabel)
        productInfoStackView.addArrangedSubview(ratingSalesInfoStackView)
        productInfoStackView.addArrangedSubview(priceLabel)
    }


    
    ///MARK: - AddSubview
    
    private func addSubview() {
        addSubview(productImageView)
        addButtonToImageView()
        addSubview(ratingCountStackView)
        addRatingElementsToStackView()
        addSubview(ratingSalesInfoStackView)
        addRatingSalesInfoToStackView()
        addSubview(productInfoStackView)
        addProductInfoToStackView()
    }
    
    //MARK: - Setup Constraints

    private func setupConstraints() {
        imageViewConstraints()
        addButtonConstraints()
        ratingCountImageConstraints()
        ratingCountStackViewConstraints()
        productInfoStackViewConstraints()
    }
    
    //MARK: - UI Elements Constraints

    private func imageViewConstraints() {
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(safeAreaLayoutGuide.snp.width).offset(-10)
            make.top.equalTo(safeAreaLayoutGuide)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(productInfoStackView.snp.top).offset(-10)
            
        }
    }
    
    private func addButtonConstraints() {
        addButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(7)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-7)
        }
    }
 
    private func ratingCountImageConstraints() {
        ratingCountImageView.snp.makeConstraints { make in
            make.width.height.equalTo(ratingCountStackView.snp.height)
        }
    }
    private func ratingCountStackViewConstraints() {
        ratingCountStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(7)
            make.leading.equalTo(productImageView.snp.leading)
            make.trailing.equalTo(productImageView.snp.trailing)
        }
    }
    
    
    private func productInfoStackViewConstraints() {
        productInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(10)
            make.leading.equalTo(productImageView.snp.leading)
            make.trailing.equalTo(productImageView.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-5)
        }
    }
}
