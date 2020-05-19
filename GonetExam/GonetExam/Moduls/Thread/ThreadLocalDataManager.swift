//
//  ThreadLocalDataManager.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class ThreadLocalDataManager:ThreadLocalDataManagerInputProtocol {
    
    
    var localRequestHandler: ThreadLocalDataManagerOutputProtocol?
    
    private let globalQueueLow = DispatchQueue.global(qos: .background)
    private let globalQueueMedium = DispatchQueue.global(qos: .utility)
    private let globalQueueHigh = DispatchQueue.global(qos: .userInteractive)

    private var successLow = false
    private var successMedium = false
    private var successHigh = false
    
    let newArrF = SynchronizedArray<String>()
    
    func startThreads() {
        successLow = false
        successMedium = false
        successHigh = false
        
        print("Execute low thread")
        executeThread(label: "Low Thread", queue: globalQueueLow) { success in
            print("success low thread")
            self.successLow.toggle()
            self.validateThreadSuccess()
        }
        
        print("Execute medium thread")
        executeThread(label: "Medium Thread", queue: globalQueueMedium) { success in
            print("success medium thread")
            self.successMedium.toggle()
            self.executeHighThread()
            self.validateThreadSuccess()
        }
    }
    
    
    fileprivate func executeThread(label: String, queue: DispatchQueue, completion: @escaping (_ success: Bool) -> Void) {
        queue.async {
            for n in 1...10000 {
                self.newArrF.append(newElement: "\(label) - \(n)")
            }
            completion(true)
        }
    }
    
    fileprivate func executeHighThread() {
        print("Execute hight thread")
        executeThread(label: "High thread", queue: globalQueueHigh) { success in
            print("success high thread")
            self.successHigh.toggle()
            self.validateThreadSuccess()
        }
    }
    
    fileprivate func validateThreadSuccess() {
        if successLow && successHigh && successMedium {
            print("All threads complete")
            //print(newArrF.all() ?? ["VACIO"])
            localRequestHandler?.threadsTerminados(content: newArrF.all() ?? [])
        }
    }
}
