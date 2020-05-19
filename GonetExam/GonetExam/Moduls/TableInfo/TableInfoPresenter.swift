//
//  TableInfoPresenter.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class TableInfoPresenter  {
    
    // MARK: Properties
    weak var view: TableInfoViewProtocol?
    var interactor: TableInfoInteractorInputProtocol?
    var wireFrame: TableInfoWireFrameProtocol?
    var parentProtocol: TableInfoToParentViewProtocol?
}

extension TableInfoPresenter: TableInfoPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configTableView()
        if let arrContent = interactor?.getContentData() {
            view?.updateContentTable(content: arrContent)
        }
    }
    
    func perfomSegueToDetail(content: ContentModel) {
        parentProtocol?.performSegueToDetail(content: content)
    }
}

extension TableInfoPresenter: TableInfoInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
