//
//  TaskListViewModel.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import Foundation
import CoreData
import Combine

class TaskListViewModel {
    @Published private(set) var tasks: [TaskEntity] = []
    private let context = CoreDataStack.shared.container.viewContext
    //private let getTasksUseCase = GetTasksUseCase()

    init() {
        fetchTasks()
    }

    func fetchTasks() {
        let req : NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        //Prefetch para enlazar con listas
        req.relationshipKeyPathsForPrefetching = ["key"]
        
        do {
            tasks = try context.fetch(req)
        } catch {
            print("Error while fetching tasks:", error)
            tasks = []
        }
        
    }
}
