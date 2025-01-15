//
//  ViewController.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 09.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to next screen", for: .normal)
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        return button
    }()
    
    private lazy var upCenterLabel: UILabel = {
        let upCenterLabel = UILabel()
        upCenterLabel.text = "My Profile"
        upCenterLabel.textColor = .black
        upCenterLabel.backgroundColor = .lightGray
        upCenterLabel.translatesAutoresizingMaskIntoConstraints = false
        return upCenterLabel
    }()
    
    override func loadView() {
        super.loadView()
        print("- - Called method: \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        print("- - Called method: \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("- - Called method: \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("- - Called method: \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("- - Called method: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("- - Called method: \(#function)")
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 70),
            
            //            upCenterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            upCenterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //            upCenterLabel.widthAnchor.constraint(equalToConstant: 120),
            //            upCenterLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func pushButton() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        controller.view.addSubview(upCenterLabel)
        func setupConstraints() {
            NSLayoutConstraint.activate([
                upCenterLabel.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
                upCenterLabel.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor),
                upCenterLabel.widthAnchor.constraint(equalToConstant: 120),
                upCenterLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        self.present(controller, animated: true)
    }
    
}

