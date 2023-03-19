// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "tuple-sequences-swift",
    products: [
        .library(
            name: "TupleSequences",
            targets: ["TupleSequences"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "TupleSequences"),
        .testTarget(
            name: "TupleSequencesTests",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                "TupleSequences"
            ]),
    ]
)
