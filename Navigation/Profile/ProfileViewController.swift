//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Malitskiy Nikolay on 20.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
    
}
