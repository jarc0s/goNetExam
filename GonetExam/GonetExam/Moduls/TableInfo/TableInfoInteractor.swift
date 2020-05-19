//
//  TableInfoInteractor.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class TableInfoInteractor: TableInfoInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: TableInfoInteractorOutputProtocol?
    var localDatamanager: TableInfoLocalDataManagerInputProtocol?
    var remoteDatamanager: TableInfoRemoteDataManagerInputProtocol?

    func getContentData() -> [ContentModel] {
        return ContentModel.getAll()
    }
}

extension TableInfoInteractor: TableInfoRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
