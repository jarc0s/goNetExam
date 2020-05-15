//
//  HomePresenter.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.createTableView()
    }
    
    func createTableView() -> UIViewController {
        guard let currentView = view as? UIViewController else { return UIViewController() }
        
        
        if let viewController = wireFrame?.presentTableView(root: currentView, presenter: self) {
            return viewController
        }
        return UIViewController()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

extension HomePresenter: TableInfoToParentViewProtocol {
    func performSegueToDetail() {
        print("Perform segue to: bla bla")
        wireFrame?.segueToDetailView(from: view!, withData: "HOLA")
    }
}
