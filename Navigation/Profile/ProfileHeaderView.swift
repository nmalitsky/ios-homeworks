//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Malitskiy Nikolay on 22.08.2022.
//

import UIKit

extension UIImageView {
    //If you want only round corners
    func imgViewCorners() {
        layer.cornerRadius = 60
        layer.borderWidth = 3.0
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
    }
}

class ProfileHeaderView: UIView {
    
    private var statusText:String = ""
    
    lazy var avatar: UIImageView = {
        let avatarView = UIImageView()
        avatarView.image = UIImage(named: "abi.jpeg")
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.imgViewCorners()
        
        return avatarView
    }()
    
    
    func addAvatar() {
        self.addSubview(self.avatar)
        
        NSLayoutConstraint.activate([
            self.avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatar.widthAnchor.constraint(equalToConstant: 120),
            self.avatar.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addTitle() {
        self.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16)
        ])
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        
        return button
    }()
    
    
    func addButton () {
        self.addSubview(self.button)
        NSLayoutConstraint.activate([
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 16 + 40 + 16)
        ])
    }
    
    @objc private func buttonAction() {
        self.statusLabel.text = statusText
    }
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = UIFont(name:"HelveticaNeue", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addStatus() {
        self.addSubview(self.statusLabel)
        
        NSLayoutConstraint.activate([
            self.statusLabel.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -(34 + 40 + 16)),
            self.statusLabel.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16)
        ])
    }
    
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Input something..."
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.font = UIFont(name:"HelveticaNeue", size: 15.0)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.layer.cornerRadius = 12.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.addTarget(self, action: #selector(textFieldAction(_:)), for: .editingChanged)
        return textField
        
    }()
    
    func addInput() {
        self.addSubview(self.inputTextField)
        
        NSLayoutConstraint.activate([
            self.inputTextField.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -34),
            self.inputTextField.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
            self.inputTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.inputTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func textFieldAction(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAvatar()
        addTitle()
        addButton()
        addStatus()
        addInput()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
