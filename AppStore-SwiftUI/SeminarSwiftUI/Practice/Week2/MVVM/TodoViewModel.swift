//
//  TodoViewModel.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func addTodo(title: String) {
        let todo = Todo(title: title, isCompleted: false)
        todos.append(todo)
    }

    func toggleTodo(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            todos.sort { !$0.isCompleted && $1.isCompleted }
        }
    }
}
