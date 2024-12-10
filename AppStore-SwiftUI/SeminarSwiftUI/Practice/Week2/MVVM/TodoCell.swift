//
//  Weather.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/30/24.
//

import SwiftUI

struct TodoCell: View {
    @ObservedObject var viewModel: TodoViewModel
    let todo: Todo
    let toggleTapped: (Todo) -> ()

    var body: some View {
        HStack {
            Text(todo.title)
            Spacer()
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(todo.isCompleted ? .green : .gray)
                .onTapGesture {
                    withAnimation {
//                        toggleTapped(todo)
                        viewModel.toggleTodo(todo)
                    }
                }
        }
    }
}
