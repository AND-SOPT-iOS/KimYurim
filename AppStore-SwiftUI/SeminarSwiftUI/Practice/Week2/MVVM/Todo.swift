//
//  Todo.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool
}
