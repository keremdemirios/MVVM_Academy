//
//  PersonTableViewCell.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func PersonFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel)
}

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PersonFollowginTableViewCell"
    weak var delegate: PersonFollowingTableViewCellDelegate?
    private var viewModel: PersonFollowingTableViewCellViewModel?
    // UI Views
    private let userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFit
        return userImageView
    }()
    
    private let nameLabel:UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .label
        return nameLabel
    }()
    
    private let usernameLabel:UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textColor = .secondaryLabel
        return usernameLabel
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configure(){
        setupUI()
    }
    
    func configure(with viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        userImageView.image = viewModel.image
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        // set button
        if viewModel.currentlyFollowing {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    private func setupUI(){
        let imageWidth = contentView.frame.size.height - 10
        contentView.addSubViews(userImageView,
                                nameLabel,
                                usernameLabel,
                                button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // image view constraints
        userImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: imageWidth,
                                     height: imageWidth )
        // name constraints
        nameLabel.frame = CGRect(x: imageWidth + 10,
                                 y: 0,
                                 width: contentView.frame.size.width - imageWidth,
                                 height: contentView.frame.size.height / 2 )
        // username constraints
        usernameLabel.frame = CGRect(x: imageWidth + 10,
                                     y: contentView.frame.size.height / 2,
                                     width: contentView.frame.size.width - imageWidth,
                                     height: contentView.frame.size.height / 2 )
        // button constraints
        button.frame = CGRect(x: contentView.frame.size.width - 60,
                              y: 10,
                              width: 110,
                              height: contentView.frame.size.height - 20 )
    }
    
    @objc func didTapButton(){
        guard let viewModel = viewModel else {
            return
        }
        delegate?.PersonFollowingTableViewCell(self, didTapWith: viewModel)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}
