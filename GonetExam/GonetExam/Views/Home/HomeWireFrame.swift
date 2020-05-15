//
//  HomeWireFrame.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    class func createHomeModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
        if let view = viewController as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol & TableInfoToParentViewProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentTableView(root: UIViewController, presenter: HomePresenter) -> UIViewController {
        let tableInfo = TableInfoWireFrame.createTableInfoModule(root: root, presenterHome: presenter)
        return tableInfo
    }
    
    func segueToDetailView(from view: HomeViewProtocol, withData: String) {
        print("AQUI AQUI 2")
        
        let newDetailView = DetailWireFrame.createDetailModule()
        
        if let currentView = view as? UIViewController {
            print("AQUI AQUI 3")
            currentView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    
}
