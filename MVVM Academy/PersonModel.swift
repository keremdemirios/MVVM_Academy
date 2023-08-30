//
//  PersonModel.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import Foundation
import UIKit

struct Person {
    let name: String
    let birthdate: Date?
    let middleName: String?
    let address: String?
    let gender: Gender
    
    init(name: String, birthdate: Date? = nil , middleName: String? = nil, address: String? = nil, gender: Gender = .unspecified) {
        self.name = name
        self.birthdate = birthdate 
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}

enum Gender {
    case male, female, unspecified
}
