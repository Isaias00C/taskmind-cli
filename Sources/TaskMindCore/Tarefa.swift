import Foundation

public enum Prioridade: String, Codable, CaseIterable, Sendable {
    case baixa, media, alta
}

public enum Status: String, Codable, Sendable {
    case pendente, concluida
}

public struct Tarefa: Codable, Identifiable, Equatable, Sendable {
    public let id: Int
    public var titulo: String
    public var prioridade: Prioridade
    public var status: Status
    public let criadaEm: Date

    public init(id: Int, titulo: String, prioridade: Prioridade = .media,
                status: Status = .pendente, criadaEm: Date = Date()) {
        self.id = id
        self.titulo = titulo
        self.prioridade = prioridade
        self.status = status
        self.criadaEm = criadaEm
    }
}