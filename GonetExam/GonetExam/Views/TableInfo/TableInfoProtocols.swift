//
//  TableInfoProtocols.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol TableInfoViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: TableInfoPresenterProtocol? { get set }
    func configTableView()
}

protocol TableInfoWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createTableInfoModule(root: UIViewController, presenterHome: HomePresenter) -> UIViewController
}

protocol TableInfoPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: TableInfoViewProtocol? { get set }
    var interactor: TableInfoInteractorInputProtocol? { get set }
    var wireFrame: TableInfoWireFrameProtocol? { get set }
    var parentProtocol: TableInfoToParentViewProtocol? { get set }
    
    func viewDidLoad()
    func perfomSegueToDetail()
}

protocol TableInfoInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol TableInfoInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: TableInfoInteractorOutputProtocol? { get set }
    var localDatamanager: TableInfoLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: TableInfoRemoteDataManagerInputProtocol? { get set }
}

protocol TableInfoDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol TableInfoRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: TableInfoRemoteDataManagerOutputProtocol? { get set }
}

protocol TableInfoRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol TableInfoLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}


protocol TableInfoToParentViewProtocol: class {
    func performSegueToDetail()
}
