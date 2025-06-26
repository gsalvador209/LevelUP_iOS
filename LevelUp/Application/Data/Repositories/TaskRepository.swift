import CoreData

final class TaskRepository {
  private let context: NSManagedObjectContext

  init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
    self.context = context
  }

  func addTask(title: String,
               description: String?,
               listId: Int64,
               deadline: Date?) throws
  {
    let task = Task(context: context)
    task.id = UUID()
    task.title = title
    task.desc = description
    task.listId = listId
    task.deadline = deadline
    try context.save()             // lanza error si falla
  }

  // Aquí podrías añadir métodos fetch/update/delete
}
