extension Sequence {
    public var triples: TriplesSequence<Self> {
        .init(base: self)
    }
}

public struct TriplesSequence<Base: Sequence> {
    let base: Base
}

extension TriplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        var iterator: Base.Iterator
        
        public mutating func next() -> (
            Base.Element,
            Base.Element,
            Base.Element
        )? {
            guard let a = iterator.next() else {
                return nil
            }
            guard let b = iterator.next(),
                  let c = iterator.next() else {
                fatalError("Not enough elements in base sequence")
            }
            return (a, b, c)
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(iterator: base.makeIterator())
    }
}
