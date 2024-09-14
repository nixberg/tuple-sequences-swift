import Algorithms
import Testing
import TupleSequences

struct TupleSequencesTests {
    let array = Array(0..<840)

    @Test
    func couples() {
        let sequence = array.couples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 2)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 2), by: ==))
    }

    @Test
    func triples() {
        let sequence = array.triples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 3)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 3), by: ==))
    }

    @Test
    func quadruples() {
        let sequence = array.quadruples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 4)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 4), by: ==))
    }

    @Test
    func quintuples() {
        let sequence = array.quintuples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 5)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 5), by: ==))
    }

    @Test
    func sextuples() {
        let sequence = array.sextuples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 6)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 6), by: ==))
    }

    @Test
    func septuples() {
        let sequence = array.septuples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 7)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 7), by: ==))
    }

    @Test
    func octuples() {
        let sequence = array.octuples()
        #expect(sequence.underestimatedCount == array.underestimatedCount / 8)
        #expect(sequence.elementsEqual(array.chunks(ofCount: 8), by: ==))
    }
}

// TODO: Use variadic generics when possible.
extension RandomAccessCollection where Element: Equatable {
    fileprivate static func == <T>(lhs: T, rhs: Self) -> Bool {
        assert(_isPOD(T.self))
        assert(MemoryLayout<Element>.size == MemoryLayout<Element>.stride)
        assert(MemoryLayout<T>.size == MemoryLayout<Element>.stride * rhs.count)
        return withUnsafeBytes(of: lhs) {
            UnsafeBufferPointer(
                start: $0.baseAddress!.assumingMemoryBound(to: Element.self),
                count: rhs.count
            ).elementsEqual(rhs)
        }
    }
}
