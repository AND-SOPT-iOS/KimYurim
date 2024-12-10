//
//  TodoViewModelWithout.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct TodoListViewWithoutMVVM: View {
    @State private var todos: [Todo] = []
    @State private var newTodoTitle = ""
    @StateObject private var viewModel = TodoViewModel()

    var body: some View {
        VStack {
            HStack {
                TextField("할 일을 입력하세요", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
//                    addTodo()
                    viewModel.addTodo(title: "")
                }
                .disabled(newTodoTitle.isEmpty)
            }
            .padding()

            List(todos) { todo in
                TodoCell(viewModel: viewModel, todo: todo) { tappedTodo in
                    toggleTodo(tappedTodo)
                }
            }
        }
    }

    private func addTodo() {
        guard !newTodoTitle.isEmpty else { return }
        let todo = Todo(title: newTodoTitle, isCompleted: false)
        todos.append(todo)
        newTodoTitle = ""
    }

    private func toggleTodo(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            withAnimation {
                todos[index].isCompleted.toggle()
                todos.sort { !$0.isCompleted && $1.isCompleted }
            }
        }
    }
}

#Preview {
    TodoListViewWithoutMVVM()
}
