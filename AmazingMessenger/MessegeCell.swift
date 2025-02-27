//
//  MessegeCellModel.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 20.02.2025.
//

import UIKit

final class MessageCell: UITableViewCell, NewConfigurableViewProtocol {
    
    private let bubbleView: UIView = {
        let bubbleView = UIView()
        bubbleView.layer.cornerRadius = 15
        bubbleView.backgroundColor = .systemBlue
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleView
    }()
    
    private let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 17)
        messageLabel.textColor = .white
        messageLabel.textAlignment = .left
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    private let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .systemGray4
        timeLabel.textAlignment = .right
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    private lazy var incomingConstraints: [NSLayoutConstraint] = [
        bubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -75)
    ]
    
    private lazy var outgoingConstraints: [NSLayoutConstraint] = [
        bubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 75)
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        contentView.addSubview(bubbleView)
        bubbleView.addSubview(messageLabel)
        bubbleView.addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -46),
            
            timeLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -12),
            timeLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6)
        ])
    }
    
    func configure(with model: MessageCellModel) {
        messageLabel.text = model.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeLabel.text = dateFormatter.string(from: model.date)
        
        NSLayoutConstraint.deactivate(incomingConstraints)
        NSLayoutConstraint.deactivate(outgoingConstraints)
        
        if model.incomingMessage {
            bubbleView.backgroundColor = .systemGray5
            messageLabel.textColor = .black
            timeLabel.textColor = .systemGray
            NSLayoutConstraint.activate(incomingConstraints)
        } else {
            NSLayoutConstraint.activate(outgoingConstraints)
        }
    }
}

protocol NewConfigurableViewProtocol {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}
