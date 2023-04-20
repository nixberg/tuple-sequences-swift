extension Sequence {
    public func sextuples() -> SextuplesSequence<Self> {
        SextuplesSequence(base: self)
    }
}

public struct SextuplesSequence<Base: Sequence> {
    fileprivate let base: Base
}

extension SextuplesSequence: Sequence {
    public struct Iterator: IteratorProtocol {
        fileprivate var iterator: Base.Iterator
        
        public mutating func next() -> (
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
                  let f = iterator.next() else {
                fatalError("Not enough elements in base sequence")
            }
            return (a, b, c, d, e, f)
        }
    }
    
    public func makeIterator() -> Iterator {
        Iterator(iterator: base.makeIterator())
    }
}
