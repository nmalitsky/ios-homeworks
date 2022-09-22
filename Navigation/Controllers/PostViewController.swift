//
//  PostViewController.swift
//  Navigation
//
//  Created by Malitskiy Nikolay on 20.08.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "404"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray4
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Еще...", style: .plain, target: self, action: #selector(presentModal))
    }
    
    @objc private func presentModal() {
        let infoViewController = InfoViewController()
        let nav = UINavigationController(rootViewController: infoViewController)
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(nav, animated: true, completion: nil)
    }
}
