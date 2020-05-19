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
        sender.selectedSegmentIndex == 0 ? presenter?.showThreadView(show: false) : presenter?.showThreadView(show: true)
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func configView() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func createThreadView() {
        if let threadView = presenter?.createThreadView() {
            self.addChild(threadView)
            threadView.didMove(toParent: self)
            contentView.addSubview(threadView.view)
            threadView.view.translatesAutoresizingMaskIntoConstraints = false
            threadView.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            threadView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            threadView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            threadView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        }
    }
    
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
    
    func hideTableView() {
        if let tableInfo = contentView.subviews.first {
            tableInfo.isHidden.toggle()
        }
    }
    
    func removeLastView() {
        if let threadView = contentView.subviews.last {
            threadView.removeFromSuperview()
        }
    }
    
    
}



