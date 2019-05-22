//
//  Datas.swift
//  N5mok
//
//  Created by hyeoktae kwon on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Firebase

let dbRef = Database.database().reference()



struct Time {
    static let short = 0.3
    static let middle = 0.65
    static let long = 1.0
}

struct UI {
    static let menuCount = 3
    static let menuSize: CGFloat = 60
    static let distance: CGFloat = 130
    static let minScale: CGFloat = 0.3
}

var playerID = String()

var playerProfileImg = UIImage()


func uploadUserInfo() {
    print("db search, ",dbRef.child("Users"))
}
