//
//  TableInfoView.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class TableInfoView: UITableViewController {

    // MARK: Properties
    var presenter: TableInfoPresenterProtocol?
    var content: [ContentModel] = [ContentModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension TableInfoView: TableInfoViewProtocol {
    
    // TODO: implement view output methods
    func configTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 90
        //self.tableView.register(TableInfoCellView.self, forCellReuseIdentifier: "CellInfo")
    }
    
    func updateContentTable(content: [ContentModel]) {
        self.content = content
    }
}


extension TableInfoView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellInfo", for: indexPath) as! TableInfoCellView
        let contentModel = content[indexPath.row]
        cell.setContents(title: contentModel.titleContent, description: contentModel.descriptionContent, image: UIImage(named: contentModel.imageName)!)
        return cell
    }
//    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentModel = content[indexPath.row]
        presenter?.perfomSegueToDetail(content: contentModel)
    }
    
}
