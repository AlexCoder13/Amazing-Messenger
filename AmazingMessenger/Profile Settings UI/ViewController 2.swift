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
    
    private lazy var initialsNameLabel: UILabel = {
        let initialsNameLabel = UILabel()
        initialsNameLabel.text = "SJ"
        initialsNameLabel.textColor = .white
        initialsNameLabel.font = .boldSystemFont(ofSize: 50)
        initialsNameLabel.textAlignment = .center
        initialsNameLabel.backgroundColor = .clear
        initialsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return initialsNameLabel
    }()
    
    private lazy var infoProfileLabel: UILabel = {
        let infoProfileLabel = UILabel()
        infoProfileLabel.text = "UX/UI designer, web designer Moscow, Russia"
        infoProfileLabel.textColor = .lightGray
        infoProfileLabel.font = .systemFont(ofSize: 17)
        infoProfileLabel.textAlignment = .center
        infoProfileLabel.numberOfLines = 2
        infoProfileLabel.backgroundColor = .clear
        infoProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoProfileLabel
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.systemBlue, for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 17)
        closeButton.contentHorizontalAlignment = .left
        closeButton.addTarget(self, action: #selector(pushCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        return closeButton
    }()
    
    private lazy var editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: 17)
        editButton.contentHorizontalAlignment = .right
        editButton.addTarget(self, action: #selector(pushEditButton), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.backgroundColor = .clear
        return editButton
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let addPhotoButton = UIButton()
        addPhotoButton.setTitle("Add Photo", for: .normal)
        addPhotoButton.setTitleColor(.systemBlue, for: .normal)
        addPhotoButton.titleLabel?.font = .systemFont(ofSize: 17)
        addPhotoButton.addTarget(self, action: #selector(pushAddPhotoButton), for: .touchUpInside)
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        addPhotoButton.backgroundColor = .clear
        return addPhotoButton
    }()
    
    private lazy var viewImage: UIView = {
        let viewImage = UIView()
        viewImage.backgroundColor = .placeholderText
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
        
        view.addSubview(viewImage)
        view.addSubview(mainImage)
        
        view.addSubview(upCenterLabel)
        view.addSubview(nameLabel)
        view.addSubview(initialsNameLabel)
        view.addSubview(infoProfileLabel)
        
        view.addSubview(closeButton)
        view.addSubview(editButton)
        view.addSubview(addPhotoButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            upCenterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            upCenterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upCenterLabel.heightAnchor.constraint(equalToConstant: 22),
            upCenterLabel.widthAnchor.constraint(equalToConstant: 81),
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 308),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 28),
            nameLabel.widthAnchor.constraint(equalToConstant: 181),
            
            initialsNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            initialsNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initialsNameLabel.heightAnchor.constraint(equalToConstant: 49),
            initialsNameLabel.widthAnchor.constraint(equalToConstant: 66),
            
            infoProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 346),
            infoProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoProfileLabel.widthAnchor.constraint(equalToConstant: 227),
            infoProfileLabel.heightAnchor.constraint(equalToConstant: 44),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 105),
            closeButton.heightAnchor.constraint(equalToConstant: 22),
            
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            editButton.widthAnchor.constraint(equalToConstant: 30),
            editButton.heightAnchor.constraint(equalToConstant: 22),
            
            
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 262),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 81),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 22),
            
            viewImage.heightAnchor.constraint(equalToConstant: 150),
            viewImage.widthAnchor.constraint(equalToConstant: 150),
            viewImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            viewImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
            mainImage.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc private func pushCloseButton() {
        self.dismiss(animated: true)
    }
    
    @objc private func pushEditButton() {
        print("'Edit' button is pushed.")
    }
    
    @objc private func pushAddPhotoButton() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Сделать фото", style: .default) { _ in
            print("Open the camera")
        }
        
        let gallery = UIAlertAction(title: "Выбрать из галереи", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true)
            self.initialsNameLabel.isHidden = true
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        mainImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true)
    }
}
