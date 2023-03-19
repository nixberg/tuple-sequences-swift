extension Sequence {
    public var couples: CouplesSequence<Self> {
        .init(base: self)
    }
}

public struct CouplesSequence<Base: Sequence> {
    let base: Base
}

extension CouplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        var iterator: Base.Iterator
        
        public mutating func next() -> (
            Base.Element,
            Base.Element
        )? {
            guard let a = iterator.next() else {
                return nil
            }
            guard let b = iterator.next() else {
                fatalError("Not enough elements in base sequence")
            }
            return (a, b)
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(iterator: base.makeIterator())
    }
}
