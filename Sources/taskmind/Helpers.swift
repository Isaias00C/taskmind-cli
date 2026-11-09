import ArgumentParser
import TaskMindCore

extension Prioridade: ExpressibleByArgument {}
extension Status: ExpressibleByArgument {}

func criarServico() -> TarefaService {
    TarefaService(store: JSONTarefaStore())
}

func formatar(_ t: Tarefa) -> String {
    let marca = t.status == .concluida ? "[x]" : "[ ]"
    return "\(marca) #\(t.id) (\(t.prioridade.rawValue)) \(t.titulo)"
}