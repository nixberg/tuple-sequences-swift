extension Sequence {
    public var octuples: OctuplesSequence<Self> {
        .init(base: self)
    }
}

public struct OctuplesSequence<Base: Sequence> {
    let base: Base
}

extension OctuplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        var iterator: Base.Iterator
        
        public mutating func next() -> (
            Base.Element,
            Base.Element,
            Base.Element,
            Base.Element,
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
                  let d = iterator.next(),
                  let e = iterator.next(),
                  let f = iterator.next(),
                  let g = iterator.next(),
                  let h = iterator.next() else {
                fatalError("Not enough elements in base sequence")
            }
            return (a, b, c, d, e, f, g, h)
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(iterator: base.makeIterator())
    }
}
