// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "taskmind-cli",
    products: [
        .executable(name: "taskmind", targets: ["taskmind"]),
        .library(name: "TaskMindCore", targets: ["TaskMindCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
    ],
    targets: [
        .target(name: "TaskMindCore"),
        .executableTarget(
            name: "taskmind",
            dependencies: [
                "TaskMindCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ],
    swiftLanguageModes: [.v5]   // evita brigar com concorrência estrita agora; migrar fica como próximo passo
)