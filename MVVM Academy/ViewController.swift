//
//  ViewController.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import UIKit

//struct Person {
//    let name: String
//}

class ViewController: UIViewController {
    
    private var models = [Person]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        configure()
    }
    
    private func configure(){
        setupUI()
        configureModels()
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureModels(){
        let names = [
            "Jay",
            "Kerem",
            "Murat",
            "Joe",
            "Jesicca",
            "Mahmut",
            "Jay",
            "Kerem",
            "King",
            "Jashua",
            "Catty"
        ]
        
        for name in names {
            models.append(Person(name: name))
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as? PersonFollowingTableViewCell else {
            fatalError()
        }
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: model))
        cell.delegate = self
        return cell
    }
}

extension ViewController: PersonFollowingTableViewCellDelegate {
    func PersonFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        <#code#>
    }
}
