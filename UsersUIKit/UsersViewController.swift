//
//  UsersViewController.swift
//  UsersUIKit
//
//  Created by Evgen on 13.01.2023.
//

import UIKit
import Contracts

public protocol DataFetchable {
    func fetchData(completion: @escaping ([UserModel]) -> Void)
}

public class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataFetchable: DataFetchable
    
    var users: [UserModel] = []

    var tableView: UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    public init(dataFetchable: DataFetchable) {
        self.dataFetchable = dataFetchable
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFetchable.fetchData {[weak self] (users) in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
    }
    

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension UsersViewController {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let user: UserModel = users[indexPath.row]
        cell.textLabel?.text = user.fullName
        cell.detailTextLabel?.text = user.description
        
        loadImage(from: user.picture.thumbnail) {[weak self] (img) in
            cell.accessoryView = UIImageView(image: img)
        }
        return cell
    }

    func loadImage(from url:String, completion: @escaping (UIImage) -> Void ) {

        guard let url = URL(string: url) else {
            return
        }
        
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       completion(image)
                    }
                }
            }
        }
    }

