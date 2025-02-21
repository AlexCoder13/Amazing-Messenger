//
//  MessegeCellModel.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 20.02.2025.
//

import UIKit

final class MessegeTableViewCell: UITableViewCell, ConfigurableViewProtocol2 {
    
    private lazy var messegeLabel: UILabel = {
        let messegeLabel = UILabel()
        messegeLabel.textColor = .black
        messegeLabel.font = .systemFont(ofSize: 17)
        messegeLabel.textAlignment = .left
        messegeLabel.translatesAutoresizingMaskIntoConstraints = false
        return messegeLabel
    }()
    
    private lazy var messegeView: UIView = {
        let messegeView = UIView()
        messegeView.backgroundColor = .systemBlue
        messegeView.layer.cornerRadius = 23
        messegeView.clipsToBounds = true
        messegeView.translatesAutoresizingMaskIntoConstraints = false
        return messegeView
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
        contentView.addSubview(messegeLabel)
        contentView.addSubview(messegeView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            messegeLabel.centerXAnchor.constraint(equalTo: messegeView.centerXAnchor),
            messegeLabel.centerYAnchor.constraint(equalTo: messegeView.centerYAnchor),
            
            messegeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            messegeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            messegeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            messegeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure2(with model: MessegeCellModel) {
        messegeLabel.text = model.text
    }
}

struct MessegeCellModel {
    let text: String
    var date: String
    
    init(text: String, date: String) {
        self.text = text
        self.date = date
    }
}

protocol ConfigurableViewProtocol2 {
    associatedtype ConfigurationModel
    func configure2(with model: ConfigurationModel)
}
