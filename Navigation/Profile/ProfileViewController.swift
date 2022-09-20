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
    
    private func rowSize(forView view: UIView) -> CGSize {
        return view.systemLayoutSizeFitting(
            CGSize(width: view.bounds.width,
                   height: UIView.layoutFittingCompressedSize.height)
        )
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
    
}
