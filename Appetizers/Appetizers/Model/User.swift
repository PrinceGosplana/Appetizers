//
//  User.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 26.03.2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lasttName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
