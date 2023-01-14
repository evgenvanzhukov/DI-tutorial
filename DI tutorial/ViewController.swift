//
//  ViewController.swift
//  DI tutorial
//
//  Created by Evgen on 13.01.2023.
//

import UIKit
import Contacts
import UsersUIKit
import ApiManager

extension ApiManager : DataFetchable {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("fetch data", for: .normal)
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc
    func btnPressed() {
        var controller = UsersViewController(dataFetchable: ApiManager.shared)
        present(controller, animated: true, completion: nil)
    }

}

