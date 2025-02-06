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
        button.backgroundColor = .clear
        return button
    }()
    
//    override func loadView() {
//        super.loadView()
//        print("- - Called method: \(#function)")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
//        print("- - Called method: \(#function)")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("- - Called method: \(#function)")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("- - Called method: \(#function)")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("- - Called method: \(#function)")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("- - Called method: \(#function)")
//    }
    
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
        ])
    }
    
    @objc private func pushButton() {
        let controller = SecondViewController()
        self.present(controller, animated: true)
    }
    
}

