//
//  ViewController 2.swift
//  AmazingMessenger
//
//  Created by Александр Семёнов on 16.01.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var upCenterLabel: UILabel = {
        let upCenterLabel = UILabel()
        upCenterLabel.text = "My Profile"
        upCenterLabel.textColor = .black
        upCenterLabel.font = .boldSystemFont(ofSize: 17)
        upCenterLabel.textAlignment = .center
        upCenterLabel.backgroundColor = .clear
        upCenterLabel.translatesAutoresizingMaskIntoConstraints = false
        return upCenterLabel
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Stephen Johnson"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 22)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .clear
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var infoProfileLabel: UILabel = {
        let infoProfileLabel = UILabel()
        infoProfileLabel.text = "UX/UI designer, web designer Moscow, Russia"
        infoProfileLabel.textColor = .lightGray
        infoProfileLabel.numberOfLines = 2
        infoProfileLabel.font = .systemFont(ofSize: 17)
        infoProfileLabel.textAlignment = .center
        infoProfileLabel.backgroundColor = .clear
        infoProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoProfileLabel
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.systemBlue, for: .normal)
        closeButton.addTarget(self, action: #selector(pushCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        return closeButton
    }()
    
    private lazy var editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        editButton.addTarget(self, action: #selector(pushEditButton), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.backgroundColor = .clear
        return editButton
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let addPhotoButton = UIButton()
        addPhotoButton.setTitle("Add Photo", for: .normal)
        addPhotoButton.setTitleColor(.systemBlue, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(pushAddPhotoButton), for: .touchUpInside)
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        addPhotoButton.backgroundColor = .clear
        return addPhotoButton
    }()
    
    private lazy var viewImage: UIView = {
        let viewImage = UIView()
        viewImage.backgroundColor = .systemPink
        viewImage.layer.cornerRadius = 75
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        return viewImage
    }()
    
    private lazy var mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.layer.cornerRadius = 75
        mainImage.clipsToBounds = true
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(upCenterLabel)
        view.addSubview(nameLabel)
        view.addSubview(infoProfileLabel)
        
        view.addSubview(closeButton)
        view.addSubview(editButton)
        view.addSubview(addPhotoButton)
        
        view.addSubview(viewImage)
        view.addSubview(mainImage)
    }
    
    private func setupConstraints() {
        upCenterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17).isActive = true
        upCenterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upCenterLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        upCenterLabel.widthAnchor.constraint(equalToConstant: 81).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 320).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        infoProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 355).isActive = true
        infoProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoProfileLabel.widthAnchor.constraint(equalToConstant: 227).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        
        editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260).isActive = true
        
        viewImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        viewImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        viewImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        viewImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        mainImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc private func pushCloseButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func pushEditButton() {
        print("'Edit' button is pushed.")
    }
    
    @objc private func pushAddPhotoButton() {
        print("'Add Photo' button is pushed.")
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Сделать фото", style: .default) { (camera) in
            print("Open the camera")
        }
        let gallery = UIAlertAction(title: "Выбрать из галереи", style: .default) { (gallery) in
            print("Choose from the Gallery")
            
            let image = UIImage(named: "IMG_5878")
            self.mainImage.image = image
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { (cancel) in
            print("'Cancel' button pushed.")
        }
            
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
}

