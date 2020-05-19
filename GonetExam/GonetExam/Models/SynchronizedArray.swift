//
//  SynchronizedArray.swift
//  GonetExam
//
//  Created by Juan Arcos on 18/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

public class SynchronizedArray<T> {
    private var array: [T] = []
    private let accessQueue = DispatchQueue(label: "SynchronizedArrayAccess", attributes: .concurrent)

    public func append(newElement: T) {

        self.accessQueue.async(flags:.barrier) {
            self.array.append(newElement)
        }
    }

    public func removeAtIndex(index: Int) {

        self.accessQueue.async(flags:.barrier) {
            self.array.remove(at: index)
        }
    }

    public var count: Int {
        var count = 0

        self.accessQueue.sync {
            count = self.array.count
        }

        return count
    }

    public func first() -> T? {
        var element: T?

        self.accessQueue.sync {
            if !self.array.isEmpty {
                element = self.array[0]
            }
        }

        return element
    }

    public func all() -> [T]? {
        var arr: [T]?
        
        self.accessQueue.sync {
            if !self.array.isEmpty {
                arr = self.array
            }
        }
        
        return arr
    }
    
    public subscript(index: Int) -> T {
        set {
            self.accessQueue.async(flags:.barrier) {
                self.array[index] = newValue
            }
        }
        get {
            var element: T!
            self.accessQueue.sync {
                element = self.array[index]
            }

            return element
        }
    }
}
