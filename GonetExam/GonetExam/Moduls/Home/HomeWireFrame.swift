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
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
        if let view = navController.children.first as? HomeView {
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
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentTableView(presenter: HomePresenter) -> UIViewController {
        let tableInfo = TableInfoWireFrame.createTableInfoModule(presenterHome: presenter)
        return tableInfo
    }
    
    func presentThreadView() -> UIViewController {
        let threadView = ThreadWireFrame.createThreadModule()
        return threadView
    }
    
    func segueToDetailView(from view: HomeViewProtocol, withData: ContentModel) {
        
        let newDetailView = DetailWireFrame.createDetailModule(with: withData)
        
        if let currentView = view as? UIViewController {
            currentView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    
}
