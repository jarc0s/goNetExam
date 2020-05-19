//
//  TableInfoWireFrame.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class TableInfoWireFrame: TableInfoWireFrameProtocol {

    class func createTableInfoModule(presenterHome: HomePresenter) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TableInfoView")
        if let view = viewController as? TableInfoView {
            let presenter: TableInfoPresenterProtocol & TableInfoInteractorOutputProtocol = TableInfoPresenter()
            let interactor: TableInfoInteractorInputProtocol & TableInfoRemoteDataManagerOutputProtocol = TableInfoInteractor()
            let localDataManager: TableInfoLocalDataManagerInputProtocol = TableInfoLocalDataManager()
            let remoteDataManager: TableInfoRemoteDataManagerInputProtocol = TableInfoRemoteDataManager()
            let wireFrame: TableInfoWireFrameProtocol = TableInfoWireFrame()
            
            //view.delegate = presenterHome
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.parentProtocol = presenterHome
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "TableInfoView", bundle: Bundle.main)
    }
    
}
