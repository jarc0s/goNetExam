//
//  ThreadWireFrame.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class ThreadWireFrame: ThreadWireFrameProtocol {

    class func createThreadModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ThreadView")
        if let view = viewController as? ThreadView {
            let presenter: ThreadPresenterProtocol & ThreadInteractorOutputProtocol = ThreadPresenter()
            let interactor: ThreadInteractorInputProtocol & ThreadRemoteDataManagerOutputProtocol & ThreadLocalDataManagerOutputProtocol = ThreadInteractor()
            let localDataManager: ThreadLocalDataManagerInputProtocol = ThreadLocalDataManager()
            let remoteDataManager: ThreadRemoteDataManagerInputProtocol = ThreadRemoteDataManager()
            let wireFrame: ThreadWireFrameProtocol = ThreadWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            localDataManager.localRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ThreadView", bundle: Bundle.main)
    }
    
}
