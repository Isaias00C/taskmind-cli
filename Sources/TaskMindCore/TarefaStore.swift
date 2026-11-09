public protocol TarefaStore {
    func carregar() throws -> [Tarefa]
    func salvar(_ tarefas: [Tarefa]) throws
}