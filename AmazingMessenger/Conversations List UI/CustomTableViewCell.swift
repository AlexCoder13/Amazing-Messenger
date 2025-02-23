//
//  CustomTableViewCell.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 06.02.2025.
//

import UIKit

final class CustomTableViewCell: UITableViewCell, ConfigurableViewProtocol {
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.textColor = .gray
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    private lazy var avatarView: UIView = {
        let avatarView = UIView()
        avatarView.backgroundColor = .darkGray
        avatarView.layer.cornerRadius = 23
        avatarView.clipsToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        //        avatarImageView.image = UIImage(named: <#T##String#>)
        avatarImageView.layer.cornerRadius = 23
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var statusView: UIView = {
        let statusView = UIView()
        statusView.backgroundColor = .systemGreen
        statusView.layer.cornerRadius = 6
        statusView.clipsToBounds = true
        statusView.isHidden = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        return statusView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContentView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(avatarView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(statusView)
        contentView.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 73),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36.42),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 55),
            
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 73),
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 39),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            messageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 45),
            avatarView.widthAnchor.constraint(equalToConstant: 45),
            
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 45),
            avatarImageView.widthAnchor.constraint(equalToConstant: 45),
            
            statusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 49),
            statusView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            statusView.heightAnchor.constraint(equalToConstant: 12),
            statusView.widthAnchor.constraint(equalToConstant: 12),
            
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22.5),
            button.heightAnchor.constraint(equalToConstant: 9),
            button.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func configure(with model: ConversationCellModel) {
        nameLabel.text = model.name
        dateLabel.text = model.date
        messageLabel.text = model.message
        statusView.isHidden = !model.isOnline
        if model.hasUnreadMessages == false {
            messageLabel.font = .boldSystemFont(ofSize: 15)
            messageLabel.textColor = .black
        } else {
            messageLabel.font = .systemFont(ofSize: 15)
            messageLabel.textColor = .gray
        }
        
        if messageLabel.text == nil {
            messageLabel.text = "No messages yet..."
            messageLabel.font = .italicSystemFont(ofSize: 15)
            messageLabel.textColor = .black
        }
        
    }
    
    @objc
    private func pushButton() {
        print("Button pushed")
    }
}

struct ConversationCellModel {
    let name: String
    let message: String?
    let date: String?  //Date?
    let isOnline: Bool
    let hasUnreadMessages: Bool
    
    init(name: String, message: String?, date: String?, isOnline: Bool, hasUnreadMessages: Bool) {
        self.name = name
        self.message = message
        self.date = date
        self.isOnline = isOnline
        self.hasUnreadMessages = Bool.random()
    }
}


protocol ConfigurableViewProtocol {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}
