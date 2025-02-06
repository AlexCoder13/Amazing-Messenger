//
//  ConversationsListViewController.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 06.02.2025.
//

import UIKit

class ConversationsListViewController: UIViewController {
    
    private lazy var chatLabel: UILabel = {
        let chatLabel = UILabel()
        chatLabel.text = "Chat"
        chatLabel.textColor = .black
        chatLabel.font = .boldSystemFont(ofSize: 34)
        chatLabel.textAlignment = .left
        chatLabel.numberOfLines = 0
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        return chatLabel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
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
        view.addSubview(chatLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            chatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 93),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "ONLINE"
            } else {
                return "HISTORY"
            }
        }
}

extension ConversationsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let name = "Name #\(indexPath.row)"
        let message = "Message #\(indexPath.row)"
        let date = "Date #\(indexPath.row)"
        let model = ConversationCellModel(name: name, message: message, date: date, isOnline: true, hasUnreadMessages: false)
        cell.configure(with: model)
        return cell
    }
}
