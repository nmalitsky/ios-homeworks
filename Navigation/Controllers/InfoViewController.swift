//
//  InfoViewController.swift
//  Navigation
//
//  Created by Malitskiy Nikolay on 20.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.title = "Подробности"
        addButton()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 7
        button.setTitle("Закрыть", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func addButton () {
        self.view.addSubview(self.button)
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
    }
    
    @objc private func buttonAction() {
        let alert = UIAlertController(title: "Внимание!", message: "Закрыть подробности?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Выбрано \"OK\"")
            self.dismiss(animated: true)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Отмена", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Выбрано \"Отмена\"")
        }))
        present(alert, animated: true, completion: nil)
    }
}
