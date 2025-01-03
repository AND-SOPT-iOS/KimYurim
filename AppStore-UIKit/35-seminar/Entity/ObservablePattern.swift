//
//  Observable.swift
//  35-seminar
//
//  Created by 김유림 on 1/1/25.
//

import Foundation

final class ObservablePattern<T: Equatable> {
    
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
    
}
