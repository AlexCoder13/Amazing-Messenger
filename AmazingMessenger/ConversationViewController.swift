//
//  ConversationViewController.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 20.02.2025.
//

import UIKit

final class ConversationViewController: UIViewController {
    
    private var messeges = [
        MessageModel(text: "Привет, как дела?", fromMe: true, date: "11.01"),
        MessageModel(text: "", fromMe: false, date: "11.04"),
        MessageModel(text: "", fromMe: false, date: "11.11"),
        MessageModel(text: "", fromMe: false, date: "11.13"),
    ]
    
    private lazy var upView: UIView = {
        let upView = UIView()
        upView.backgroundColor = .systemGray5
        upView.clipsToBounds = true
        upView.translatesAutoresizingMaskIntoConstraints = false
        return upView
    }()
    
    private lazy var avatarView: UIView = {
        let avatarView = UIView()
        avatarView.backgroundColor = .darkGray
        avatarView.layer.cornerRadius = 25
        avatarView.clipsToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        //        avatarImageView.image = UIImage(named: <#T##String#>)
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var profileNameLabel: UILabel = {
        let profileNameLabel = UILabel()
        profileNameLabel.text = "name name"
        profileNameLabel.textColor = .black
        profileNameLabel.font = .systemFont(ofSize: 11)
        profileNameLabel.textAlignment = .center
        profileNameLabel.numberOfLines = 0
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return profileNameLabel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(MessegeTableViewCell.self, forCellReuseIdentifier: "customMessegeCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(upView)
        view.addSubview(avatarView)
        view.addSubview(avatarImageView)
        view.addSubview(profileNameLabel)
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            upView.heightAnchor.constraint(equalToConstant: 137),
            upView.widthAnchor.constraint(equalToConstant: 410),
            upView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upView.topAnchor.constraint(equalTo: view.topAnchor),
            
            avatarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 50),
            avatarView.widthAnchor.constraint(equalToConstant: 50),
            
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            
            profileNameLabel.heightAnchor.constraint(equalToConstant: 13),
            profileNameLabel.widthAnchor.constraint(equalToConstant: 100),
            profileNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 113),
            profileNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 157),
            tableView.heightAnchor.constraint(equalToConstant: 294),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


extension ConversationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ConversationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messeges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let messegeCell = tableView.dequeueReusableCell(withIdentifier: "customMessegeCell", for: indexPath) as? MessegeTableViewCell else {
            return UITableViewCell()
        }
        
        let messegeModel = MessegeCellModel(text: "aaaaaaaaaaaaa", date: "11.01")
        messegeCell.configure2(with: messegeModel)
        return messegeCell
    }
}
