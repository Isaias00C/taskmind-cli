import Foundation

public struct JSONTarefaStore: TarefaStore {
    private let url: URL

    public init(url: URL = JSONTarefaStore.caminhoPadrao) {
        self.url = url
    }

    /// ~/.taskmind/tarefas.json
    public static var caminhoPadrao: URL {
        FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent(".taskmind")
            .appendingPathComponent("tarefas.json")
    }

    public func carregar() throws -> [Tarefa] {
        guard FileManager.default.fileExists(atPath: url.path) else { return [] }
        let dados = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Tarefa].self, from: dados)
    }

    public func salvar(_ tarefas: [Tarefa]) throws {
        let pasta = url.deletingLastPathComponent()
        try FileManager.default.createDirectory(at: pasta, withIntermediateDirectories: true)
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        try encoder.encode(tarefas).write(to: url, options: .atomic)
    }
}