//
//  TaskRepository.swift
//  LevelUp
//
//  Created by Salvador Chavez on 25/06/25.
//


import CoreData

final class TaskRepository {
    // MARK: - Dependencia de Core Data
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    // MARK: - Create

    func addTask(title: String,
                 description: String?,
                 list: ListEntity,
                 startDate: Date?,
                 deadline: Date?,
                 reminders: String?) throws
    {
      let task = TaskEntity(context: context)
      task.id             = UUID()
      task.title          = title
      task.taskDescription = description
      task.list           = list
      task.startDate      = startDate
      task.deadline       = deadline
      task.reminders      = reminders
      task.createdAt      = Date()
      task.updatedAt      = Date()
      task.isCompleted    = false
      try context.save()
    }
    
    // MARK: - Read
    func fetchAllTasks() throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        return try context.fetch(req)
    }

    
    func fetchTask(by id: UUID) throws -> TaskEntity? {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        req.fetchLimit = 1
        return try context.fetch(req).first
    }

    
    func fetchTasks(inListId listId: Int64) throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "list.id == %d", listId)
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        return try context.fetch(req)
    }

    
    func fetchPendingTasks() throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "isCompleted == NO")
        req.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true)]
        return try context.fetch(req)
    }

    
    func fetchCompletedTasks() throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "isCompleted == YES")
        req.sortDescriptors = [NSSortDescriptor(key: "completedAt", ascending: false)]
        return try context.fetch(req)
    }

    
    func fetchTasks(dueBefore date: Date) throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "deadline != nil AND deadline < %@", date as CVarArg)
        req.sortDescriptors = [NSSortDescriptor(key: "deadline", ascending: true)]
        return try context.fetch(req)
    }
    
    func fetchTasks(from start: Date, to end: Date) throws -> [TaskEntity] {
        let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        req.predicate = NSPredicate(format: "deadline >= %@ AND deadline <= %@", start as CVarArg, end as CVarArg)
        req.sortDescriptors = [NSSortDescriptor(key: "deadline", ascending: true)]
        return try context.fetch(req)
    }

    // MARK: - Update

    
    func update(task: TaskEntity) throws {
        task.updatedAt = Date()
        try context.save()
    }

    
    func setCompleted(_ completed: Bool, for task: TaskEntity) throws {
        task.isCompleted = completed
        task.completedAt = completed ? Date() : nil
        task.updatedAt   = Date()
        try context.save()
    }

    
    func set(dates startDate: Date?, deadline: Date?, for task: TaskEntity) throws {
        task.startDate = startDate
        task.deadline  = deadline
        task.updatedAt = Date()
        try context.save()
    }

    
    func set(reminders: String?, for task: TaskEntity) throws {
        task.reminders  = reminders
        task.updatedAt  = Date()
        try context.save()
    }

    // MARK: - Delete

    
    func delete(task: TaskEntity) throws {
        context.delete(task)
        try context.save()
    }

    
    func delete(by id: UUID) throws {
        if let task = try fetchTask(by: id) {
            context.delete(task)
            try context.save()
        }
    }

    // MARK: - Helpers

    
    private func fetchListEntity(by listId: Int64) -> ListEntity? {
        let req: NSFetchRequest<ListEntity> = ListEntity.fetchRequest()
        req.predicate = NSPredicate(format: "id == %d", listId)
        req.fetchLimit = 1
        return (try? context.fetch(req).first)
    }
}
