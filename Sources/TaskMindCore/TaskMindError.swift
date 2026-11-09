import Foundation

public enum TaskMindError: Error, LocalizedError, Equatable {
    case tituloVazio
    case tarefaNaoEncontrada(id: Int)

    public var errorDescription: String? {
        switch self {
        case .tituloVazio:
            return "O título da tarefa não pode ser vazio."
        case .tarefaNaoEncontrada(let id):
            return "Não encontrei a tarefa #\(id)."
        }
    }
}