//
//  ViewController.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 09.01.2025.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("- - Called method: \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

