//
//  TodoListView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTitle = ""

    var body: some View {
        VStack {
            HStack {
                TextField("할 일을 입력하세요", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
                    viewModel.addTodo(title: newTodoTitle)
                    newTodoTitle = ""
                }
                .disabled(newTodoTitle.isEmpty)
            }
            .padding()

            List(viewModel.todos) { todo in
//                TodoCell(viewModel: viewModel, todo: todo)
            }
        }
    }
}

#Preview {
    TodoListView()
}
