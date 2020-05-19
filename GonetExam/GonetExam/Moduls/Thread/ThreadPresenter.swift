//
//  ThreadPresenter.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ThreadPresenter  {
    
    // MARK: Properties
    weak var view: ThreadViewProtocol?
    var interactor: ThreadInteractorInputProtocol?
    var wireFrame: ThreadWireFrameProtocol?
    
}

extension ThreadPresenter: ThreadPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func cleanTableView() {
        view?.setContentTable(content: [])
    }
    
    func startThreads() {
        interactor?.startThreads()
    }
}

extension ThreadPresenter: ThreadInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func updateTableThreads(content: [String]) {
        view?.setContentTable(content: content)
    }
}
