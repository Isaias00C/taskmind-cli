import Foundation

public struct TarefaService {
    private let store: any TarefaStore

    public init(store: any TarefaStore) {
        self.store = store
    }

    @discardableResult
    public func adicionar(titulo: String, prioridade: Prioridade = .media) throws -> Tarefa {
        let limpo = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !limpo.isEmpty else { throw TaskMindError.tituloVazio }

        var tarefas = try store.carregar()
        let proximoId = (tarefas.map(\.id).max() ?? 0) + 1
        let nova = Tarefa(id: proximoId, titulo: limpo, prioridade: prioridade)
        tarefas.append(nova)
        try store.salvar(tarefas)
        return nova
    }
}