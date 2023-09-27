import Algorithms
import TupleSequences
import XCTest

final class TupleSequencesTests: XCTestCase {
    private let array = Array(0..<840)
    
    func testCouples() {
        let sequence = array.couples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 2)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 2), by: ==))
    }
    
    func testTriples() {
        let sequence = array.triples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 3)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 3), by: ==))
    }
    
    func testQuadruples() {
        let sequence = array.quadruples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 4)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 4), by: ==))
    }
    
    func testQuintuples() {
        let sequence = array.quintuples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 5)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 5), by: ==))
    }
    
    func testSextuples() {
        let sequence = array.sextuples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 6)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 6), by: ==))
    }
    
    func testSeptuples() {
        let sequence = array.septuples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 7)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 7), by: ==))
    }
    
    func testOctuples() {
        let sequence = array.octuples()
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 8)
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 8), by: ==))
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
