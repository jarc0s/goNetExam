//
//  ThreadProtocols.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol ThreadViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ThreadPresenterProtocol? { get set }
    func setContentTable(content:[String])
}

protocol ThreadWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createThreadModule() -> UIViewController
}

protocol ThreadPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ThreadViewProtocol? { get set }
    var interactor: ThreadInteractorInputProtocol? { get set }
    var wireFrame: ThreadWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func cleanTableView()
    func startThreads()
}

protocol ThreadInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func updateTableThreads(content: [String])
}

protocol ThreadInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ThreadInteractorOutputProtocol? { get set }
    var localDatamanager: ThreadLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ThreadRemoteDataManagerInputProtocol? { get set }
    
    func startThreads()
}

protocol ThreadDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ThreadRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ThreadRemoteDataManagerOutputProtocol? { get set }
}

protocol ThreadRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ThreadLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: ThreadLocalDataManagerOutputProtocol? { get set }
    
    func startThreads()
}

protocol ThreadLocalDataManagerOutputProtocol: class {
    //LOCALDATAMANAGER -> INTERACTOR
    func threadsTerminados(content: [String])
}
