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
        view?.configView()
        view?.createTableView()
    }
    
    func createTableView() -> UIViewController {
        
        if let viewController = wireFrame?.presentTableView(presenter: self) {
            return viewController
        }
        return UIViewController()
    }
    
    func createThreadView() -> UIViewController {
        
        if let viewController = wireFrame?.presentThreadView() {
            return viewController
        }
        return UIViewController()
        
    }
    
    func showThreadView(show: Bool) {
        view?.hideTableView()
        if show {
            view?.createThreadView()
        }else {
            view?.removeLastView()
        }
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

extension HomePresenter: TableInfoToParentViewProtocol {
    func performSegueToDetail(content: ContentModel) {
        wireFrame?.segueToDetailView(from: view!, withData: content)
    }
}
