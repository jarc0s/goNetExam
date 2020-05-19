//
//  DetailView.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
    func configNavigationBar(showNavigation: Bool) {
        self.navigationController?.navigationBar.isHidden = !showNavigation
    }
    
    func configView(content: ContentModel) {
        titleLbl.text = content.titleContent
        if let image = UIImage(named: content.imageName) {
            imageName.image = image
        }
        descriptionLbl.text = content.descriptionContent
    }
}
