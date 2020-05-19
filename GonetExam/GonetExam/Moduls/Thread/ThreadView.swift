//
//  ThreadView.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class ThreadView: UIViewController {

    @IBOutlet weak var tableViewThreads: UITableView!
    
    var content: [String] = [String]() {
        didSet {
            print("set content")
            DispatchQueue.main.async {
                self.tableViewThreads.reloadData()
            }
        }
    }
    
    // MARK: Properties
    var presenter: ThreadPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cleanTableView(_ sender: Any) {
        presenter?.cleanTableView()
    }
    
    @IBAction func startThreads(_ sender: Any) {
        print(#function)
        presenter?.startThreads()
    }
    
    
}

extension ThreadView: ThreadViewProtocol {
    // TODO: implement view output methods
    func setContentTable(content: [String]) {
        self.content = content
    }
}

extension ThreadView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThreadCell", for: indexPath)
        cell.textLabel?.text = self.content[indexPath.row]
        
        return cell
    }
    
}
