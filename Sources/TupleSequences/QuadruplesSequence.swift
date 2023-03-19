extension Sequence {
    public var quadruples: QuadruplesSequence<Self> {
        .init(base: self)
    }
}

public struct QuadruplesSequence<Base: Sequence> {
    let base: Base
}

extension QuadruplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        var iterator: Base.Iterator
        
        public mutating func next() -> (
            Base.Element,
            Base.Element,
            Base.Element,
            Base.Element
        )? {
            guard let a = iterator.next() else {
                return nil
            }
            guard let b = iterator.next(),
                  let c = iterator.next(),
                  let d = iterator.next() else {
                fatalError("Not enough elements in base sequence")
            }
            return (a, b, c, d)
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(iterator: base.makeIterator())
    }
}
