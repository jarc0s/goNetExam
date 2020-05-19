//
//  ThreadInteractor.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ThreadInteractor: ThreadInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: ThreadInteractorOutputProtocol?
    var localDatamanager: ThreadLocalDataManagerInputProtocol?
    var remoteDatamanager: ThreadRemoteDataManagerInputProtocol?

    func startThreads() {
        localDatamanager?.startThreads()
    }
}

extension ThreadInteractor: ThreadRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

extension ThreadInteractor: ThreadLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func threadsTerminados(content: [String]) {
        print("Finalizados")
        presenter?.updateTableThreads(content: content)
    }
}
