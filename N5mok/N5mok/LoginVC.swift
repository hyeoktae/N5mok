//
//  LoginVC.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "KakaoLogin"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        autoLayout()
        
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(loginBtn)
        
        loginBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50).isActive = true
        loginBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    }
}
