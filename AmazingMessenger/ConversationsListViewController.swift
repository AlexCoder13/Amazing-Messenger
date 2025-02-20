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
    private var chatOnlineMessages: [String?] = ["Да", "Ага, опять забил", "Привет! Меня зовут Джимми", "Главное - это семья", "Обожаю очкариков со шрамами", "Тебе конец Поттер!", nil, "Ух ты! Док! Сколько времени?", nil, nil]
    
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
        
        configureBarButtons()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(chatLabel)
        view.addSubview(tableView)
        view.addSubview(profileView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            chatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 103),
            
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
            profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            profileView.heightAnchor.constraint(equalToConstant: 32),
            profileView.widthAnchor.constraint(equalToConstant: 32),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 149),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureBarButtons() {
        let rightButton = UIBarButtonItem(title: "SJ", style: .plain, target: self, action: #selector(pushpProfileButton))
        rightButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightButton
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(pushSettingsButton))
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    @objc
    private func pushpProfileButton() {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
        print("Profile Button Pushed")
    }
    
    @objc
    private func pushSettingsButton() {
        print("Settings Button pushed")
    }
    
}


extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let conversationVC = ConversationViewController()
        navigationController?.pushViewController(conversationVC, animated: true)
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
        var message: String?
        var isOnline: Bool
        if indexPath.section == 0 {
            isOnline = true
            name = nameOnlineArray[indexPath.row]
            message = chatOnlineMessages[indexPath.row]
        } else {
            isOnline = false
            name = nameOfflineArray[indexPath.row]
            message = "Message #\(indexPath.row). Колян сказал написать больше текста - пишу больше текста."
        }
        
        
        let date = "Date #\(indexPath.row)"
        let model = ConversationCellModel(name: name, message: message, date: date, isOnline: isOnline, hasUnreadMessages: Bool.random())
        cell.configure(with: model)
        return cell
    }
}
