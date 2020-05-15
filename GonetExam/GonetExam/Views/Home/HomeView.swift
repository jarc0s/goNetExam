//
//  HomeView.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var segmentOptions: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .systemPurple
    }
    
    @IBAction func changeOption(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Table")
        }else {
            print("Threads")
        }
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func createTableView() {
        if let tableInfo = presenter?.createTableView() {
            self.addChild(tableInfo)
            tableInfo.didMove(toParent: self)
            contentView.addSubview(tableInfo.view)
            tableInfo.view.translatesAutoresizingMaskIntoConstraints = false
            tableInfo.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            tableInfo.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            tableInfo.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            tableInfo.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
            
        }
    }
}



