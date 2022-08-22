//
//  FeedViewController.swift
//  Navigation
//
//  Created by Malitskiy Nikolay on 20.08.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {
    
    var post = Post(title: "Пост из ленты")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        addButton()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 7
        button.setTitle("Показать пост", for: .normal)
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
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

