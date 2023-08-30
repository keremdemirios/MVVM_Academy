//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import Foundation
import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
