//
//  ProfileView.swift
//  StoreA
//
//  Created by Ekrem Alkan on 14.01.2023.
//

import UIKit

protocol ProfileViewInterface: AnyObject {
    func profileView(_ view: ProfileView, signOutButtonTapped button: UIButton)
}

class ProfileView: UIView {
    
    //MARK: - Creating UI Elements
    
    private var profileTitleImage = CustomImageView(image: UIImage(systemName: "person.fill")!, tintColor: .black, backgroundColor: .white, contentMode: .scaleToFill, cornerRadius: 0, isUserInteractionEnabled: false)
    private var profileTitleLabel = CustomLabel(text: "Profile", numberOfLines: 0, font: .boldSystemFont(ofSize: 17), textColor: .black, textAlignment: .left)
    private var profileTitleView = CustomView(backgroundColor: .white, cornerRadius: 0)
    private var moreInfoButton = HomeButton(image: UIImage(systemName: "ellipsis.circle")!)
    private var profileImageView = CustomImageView(image: UIImage(systemName: "person")!, tintColor: .black, backgroundColor: .white, contentMode: .scaleToFill, cornerRadius: 0, isUserInteractionEnabled: false)
    private var userNameImage = CustomImageView(image: UIImage(systemName: "person.text.rectangle")!, tintColor: .black, backgroundColor: .white, contentMode: .scaleToFill, cornerRadius: 0, isUserInteractionEnabled: false)
    private var userNameLabel = CustomLabel(text: "", numberOfLines: 0, font: .boldSystemFont(ofSize: 15), textColor: .black, textAlignment: .center)
    private var userNameView = CustomView(backgroundColor: .white, cornerRadius: 0)
    private var emailImage = CustomImageView(image: UIImage(systemName: "envelope")!, tintColor: .black, backgroundColor: .white, contentMode: .scaleToFill, cornerRadius: 0, isUserInteractionEnabled: false)
    private var emailLabel = CustomLabel(text: "", numberOfLines: 0, font: .boldSystemFont(ofSize: 15), textColor: .black, textAlignment: .center)
    private var emailView = CustomView(backgroundColor: .white, cornerRadius: 0)
    private var seperatorView = SeperatorView(backgroundColor: .systemGray5)
    private var signOutButton = OnboardingButton(title: "Sign Out", titleColor: .white, font: .boldSystemFont(ofSize: 13), backgroundColor: .red, cornerRadius: 15)
    
    //MARK: - Propertis
    
    weak var interface: ProfileViewInterface?
    
    //MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview()
        setupConstraints()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(email: String, username: String) {
        profileImageView.image = UIImage(systemName: "person")
        userNameLabel.text = "Username: \(username)"
        emailLabel.text = "Email: \(email)"
    }
    
    
    //MARK: - AddTarget
    
    private func addTarget() {
        signOutButton.addTarget(self, action: #selector(addTargetButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - AddAction
    
    @objc private func addTargetButtonTapped(_ button: UIButton) {
        interface?.profileView(self, signOutButtonTapped: button)
    }
    
    //MARK: - ProfileTitleAddToView
    
    private func profileTitleAddToView() {
        profileTitleView.addSubview(profileTitleImage)
        profileTitleView.addSubview(profileTitleLabel)
    }
    
    //MARK: - UsernameLabelAddToView
    
    private func usernameLabelAddToView() {
        userNameView.addSubview(userNameImage)
        userNameView.addSubview(userNameLabel)
    }
    
    //MARK: - EmailLabelAddToView
    
    private func emailLabelAddToView() {
        emailView.addSubview(emailImage)
        emailView.addSubview(emailLabel)
    }
    
}

extension ProfileView {
    
    //MARK: - AddSubview
    
    private func addSubview() {
        addSubview(profileTitleView)
        profileTitleAddToView()
        addSubview(moreInfoButton)
        addSubview(profileImageView)
        addSubview(userNameView)
        usernameLabelAddToView()
        addSubview(emailView)
        emailLabelAddToView()
        addSubview(seperatorView)
        addSubview(signOutButton)
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstraints() {
        profileTitleViewConstraints()
        profileTitleImageConstraints()
        profileTitleConstraints()
        moreInfoButtonConstraints()
        profileImageViewConstraints()
        usernameImageConstraints()
        usernameLabelConstraints()
        usernameViewConstraints()
        emailImageConstraints()
        emailLabelConstraints()
        emailViewConstraints()
        seperatorViewConstraints()
        signOutButtonConsraints()
    }
    
    //MARK: - UI Elements Constraints
    
    private func profileTitleViewConstraints() {
        profileTitleView.snp.makeConstraints { make in
            make.height.equalTo(profileTitleLabel.snp.height)
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(15)
        }
    }
    
    private func profileTitleImageConstraints() {
        profileTitleImage.snp.makeConstraints { make in
            make.height.width.equalTo(profileTitleLabel.snp.height)
            make.leading.equalTo(profileTitleView.snp.leading)
            make.centerY.equalTo(profileTitleView.snp.centerY)
        }
    }
    
    private func profileTitleConstraints() {
        profileTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileTitleImage.snp.trailing).offset(10)
            make.centerY.equalTo(profileTitleView.snp.centerY)
            make.trailing.equalTo(profileTitleView.snp.trailing)
        }
        
    }
    
    private func moreInfoButtonConstraints() {
        moreInfoButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-15)
            make.centerY.equalTo(profileTitleView)
        }
    }
    
    private func profileImageViewConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.25)
            make.top.equalTo(profileTitleView.snp.bottom).offset(25)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    private func usernameViewConstraints() {
        userNameView.snp.makeConstraints { make in
            make.height.equalTo(userNameLabel.snp.height)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(profileImageView.snp.bottom).offset(35)
        }
    }
    
    private func usernameImageConstraints() {
        userNameImage.snp.makeConstraints { make in
            make.height.width.equalTo(userNameLabel.snp.height)
            make.leading.equalTo(userNameView.snp.leading)
            make.centerY.equalTo(userNameView.snp.centerY)
        }
    }
    
    private func usernameLabelConstraints() {
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(userNameImage.snp.trailing).offset(10)
            make.trailing.equalTo(userNameView.snp.trailing)
            make.centerY.equalTo(userNameView.snp.centerY)
        }
    }
    
    private func emailViewConstraints() {
        emailView.snp.makeConstraints { make in
            make.top.equalTo(userNameView.snp.bottom).offset(15)
            make.leading.equalTo(userNameView.snp.leading)
            make.height.equalTo(emailLabel.snp.height)
        }
    }
    
    private func emailImageConstraints() {
        emailImage.snp.makeConstraints { make in
            make.height.width.equalTo(emailLabel.snp.height)
            make.leading.equalTo(emailView.snp.leading)
            make.centerY.equalTo(emailView.snp.centerY)
        }
    }
    
    private func emailLabelConstraints() {
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailImage.snp.trailing).offset(10)
            make.trailing.equalTo(emailView.snp.trailing)
            make.centerY.equalTo(emailView.snp.centerY)
        }
    }
    
    private func seperatorViewConstraints() {
        seperatorView.snp.makeConstraints { make in
            make.height.equalTo(0.75)
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.leading.equalTo(safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
        }
    }
    
    private func signOutButtonConsraints() {
        signOutButton.snp.makeConstraints { make in
            make.height.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.1)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.25)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    
    
    
    
    
    
}


