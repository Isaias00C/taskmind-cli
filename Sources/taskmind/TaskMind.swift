import ArgumentParser
import TaskMindCore

@main
struct TaskMind: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "taskmind",
        abstract: "Gerenciador de tarefas com IA",
        subcommands: [Adicionar.self]
    )
}

struct Adicionar: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "add",
        abstract: "Adiciona uma tarefa."
    )

    @Argument(help: "Texto da tarefa.") var titulo: String
    @Option(name: .shortAndLong, help: "Prioridade da tarefa (baixa, média, alta)") var prioridade: Prioridade = .media

    func run() throws {
        let tarefa = try criarServico().adicionar(titulo: titulo, prioridade: prioridade)
        print("✅ Adicionada: \(formatar(tarefa))")
    }
}