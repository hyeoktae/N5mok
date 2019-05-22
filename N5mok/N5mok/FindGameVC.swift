//
//  FindGameVC.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class FindGameVC: UIViewController {
    
    let logoutBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Logout", for: .normal)
        btn.addTarget(self, action: #selector(didTapLogoutBtn(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        autoLayout()
    }
    
    @objc func didTapLogoutBtn(_ sender: UIButton) {
        KOSession.shared().logoutAndClose { (success, error) -> Void in
            if let error = error {
                return print(error.localizedDescription)
            }
            // Logout success
            AppDelegate.instance.setupRootViewController()
        }
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(logoutBtn)
        
        logoutBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50).isActive = true
        logoutBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
}
