//
//  PersonTableViewCell.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import UIKit

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PersonFollowginTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
