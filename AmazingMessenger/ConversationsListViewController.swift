//
//  ConversationsListViewController.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 06.02.2025.
//

import UIKit

class ConversationsListViewController: UIViewController {
    
    private var nameOnlineArray = ["Джейсон Стэтхем", "Криштиано Роналдо", "Мистер Бист", "Доменик Торетто", "Альбус Дамблдор", "Драко Малфой", "Хагрид", "Марти Макфлай", "Док", "Стив Джобс"]
    private var nameOfflineArray = ["Северус Снегг", "Букля", "Бьюфорд Танон", "Стас", "Гена", "Турбо", "Дюша Метелкин", "Дядя Вася", "Петя РЕМОНТ ВАННОЙ", "Какой-то чел с остановки" ]
    
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
    
    private lazy var profileView: UIView = {
        let profileView = UIView()
        profileView.backgroundColor = .placeholderText
        profileView.layer.cornerRadius = 16
        profileView.clipsToBounds = true
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    //    private lazy var profileButton: UIButton = {
    //        let profileButton = UIButton()
    //        profileButton.setTitle("SJ", for: .normal)
    //        profileButton.backgroundColor = .red
    //        profileButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    //        profileButton.addTarget(self, action: #selector(pushpProfileButton), for: .touchUpInside)
    //        profileButton.translatesAutoresizingMaskIntoConstraints = false
    //        return profileButton
    //    }()
    
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
        
        let rightButton = UIBarButtonItem(title: "SJ", style: .plain, target: self, action: #selector(pushpProfileButton))
        rightButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightButton
        
        //        let leftButton = UIBarButtonItem(customView: UIView)
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushpSettingsButton))
//        leftButton.customView?.heightAnchor.constraint(equalToConstant: 12).isActive = true
//        leftButton.customView?.widthAnchor.constraint(equalToConstant: 12).isActive = true
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(chatLabel)
        view.addSubview(tableView)
        view.addSubview(profileView)
        //        view.addSubview(profileButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            chatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 93),
            
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
            profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            profileView.heightAnchor.constraint(equalToConstant: 32),
            profileView.widthAnchor.constraint(equalToConstant: 32),
            
            //            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            //            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
            //            profileButton.heightAnchor.constraint(equalToConstant: 32),
            //            profileButton.widthAnchor.constraint(equalToConstant: 32),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc
    private func pushpProfileButton() {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
        print("Profile Button Pushed")
    }
    
    @objc
    private func pushpSettingsButton() {
        print("Settings Button is pushed")
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
        
        var name: String
        var isOnline: Bool
        if indexPath.section == 0 {
            isOnline = true
            name = nameOnlineArray[indexPath.row]
        } else {
            isOnline = false
            name = nameOfflineArray[indexPath.row]
        }
        
        
        let message = "Message #\(indexPath.row). Колян сказал написать больше текста - пишу больше текста."
        let date = "Date #\(indexPath.row)"
        let model = ConversationCellModel(name: name, message: message, date: date, isOnline: isOnline, hasUnreadMessages: Bool.random())
        cell.configure(with: model)
        return cell
    }
}
