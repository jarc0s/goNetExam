//
//  DetailPresenter.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var content: ContentModel?
    
    func viewDidLoad() {
        view?.configNavigationBar(showNavigation: true)
        view?.configView(content: content!)
    }
    
    func viewWillDisappear() {
        view?.configNavigationBar(showNavigation: false)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
