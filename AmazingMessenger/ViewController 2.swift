//
//  ViewController 2.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 16.01.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var upCenterLabel: UILabel = {
        let upCenterLabel = UILabel()
        upCenterLabel.text = "My Profile"
        upCenterLabel.textColor = .black
        upCenterLabel.font = .boldSystemFont(ofSize: 17)
        upCenterLabel.textAlignment = .center
        upCenterLabel.backgroundColor = .clear
        upCenterLabel.translatesAutoresizingMaskIntoConstraints = false
        return upCenterLabel
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.systemBlue, for: .normal)
        closeButton.addTarget(self, action: #selector(pushCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        return closeButton
    }()
    
    private lazy var editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        editButton.addTarget(self, action: #selector(pushEditButton), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.backgroundColor = .clear
        return editButton
    }()
    
    private lazy var viewImage: UIView = {
        let viewImage = UIView()
        viewImage.backgroundColor = .systemPink
        viewImage.layer.cornerRadius = 75
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        return viewImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(upCenterLabel)
        view.addSubview(closeButton)
        view.addSubview(editButton)
        view.addSubview(viewImage)
    }
    
    private func setupConstraints() {
        upCenterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17).isActive = true
        upCenterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 155).isActive = true
        upCenterLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        upCenterLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        
        editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        viewImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        viewImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        viewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        viewImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155).isActive = true
//        viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 155
//        ).isActive = true
    }
    
    @objc private func pushCloseButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func pushEditButton() {
        print("'Edit' button is pushed.")
    }
    
}

