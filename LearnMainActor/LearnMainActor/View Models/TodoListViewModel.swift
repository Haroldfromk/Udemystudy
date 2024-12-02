//
//  TodoListViewModel.swift
//  TodoListViewModel
//
//  Created by Mohammad Azam on 7/24/21.
//

import Foundation

@MainActor
class TodoListViewModel: ObservableObject {
    
    @Published var todos: [TodoViewModel] = []
    
    //@MainActor
    func populateTodos() async {
        
        do {
            
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
                throw NetworkError.badUrl
            }
            
            Task {
                let todos = try await Webservice().getAllTodosAsync(url: url)
                print(Thread.isMainThread)
                print(Thread.current)
                self.todos = todos.map(TodoViewModel.init)
            }

            
        }
        //            await MainActor.run {
        //                print(Thread.isMainThread)
        //            }
        //}
        //            Webservice().getAllTodos(url: url) { result in
        //                switch result {
        //                case .success(let todos):
        //                    self.todos = todos.map(TodoViewModel.init)
        //                case .failure(let error):
        //                    print(error)
        //                }
        //            }
        
        
        catch {
            print(error)
        }
    }
}
struct TodoViewModel {
    
    let todo: Todo
    
    var id: Int {
        todo.id
    }
    
    var title: String {
        todo.title
    }
    
    var completed: Bool {
        todo.completed
    }
}
