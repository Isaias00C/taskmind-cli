import ArgumentParser

@main
struct TaskMind: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "taskmind",
        abstract: "Gerenciador de tarefas com IA"
    )
}