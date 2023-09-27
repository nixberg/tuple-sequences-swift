extension Sequence {
    public func triples() -> TriplesSequence<Self> {
        TriplesSequence(base: self)
    }
}

public struct TriplesSequence<Base: Sequence> {
    fileprivate let base: Base
}

extension TriplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        fileprivate var iterator: Base.Iterator
        
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
    
    public var underestimatedCount: Int {
        base.underestimatedCount / 3
    }
    
    public func makeIterator() -> Iterator {
        Iterator(iterator: base.makeIterator())
    }
}
