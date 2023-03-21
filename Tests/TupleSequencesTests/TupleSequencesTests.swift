import Algorithms
import TupleSequences
import XCTest

final class TupleSequencesTests: XCTestCase {
    private let array = Array(0..<840)
    
    func testCouples() {
        XCTAssert(array.couples().elementsEqual(array.chunks(ofCount: 2), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1]
        }))
    }
    
    func testTriples() {
        XCTAssert(array.triples().elementsEqual(array.chunks(ofCount: 3), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2]
        }))
    }
    
    func testQuadruples() {
        XCTAssert(array.quadruples().elementsEqual(array.chunks(ofCount: 4), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3]
        }))
    }
    
    func testQuintuples() {
        XCTAssert(array.quintuples().elementsEqual(array.chunks(ofCount: 5), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4]
        }))
    }
    
    func testSextuples() {
        XCTAssert(array.sextuples().elementsEqual(array.chunks(ofCount: 6), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4] &&
            $0.5 == $1[offsetBy: 5]
        }))
    }
    
    func testSeptuples() {
        XCTAssert(array.septuples().elementsEqual(array.chunks(ofCount: 7), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4] &&
            $0.5 == $1[offsetBy: 5] &&
            $0.6 == $1[offsetBy: 6]
        }))
    }
    
    func testOctuples() {
        XCTAssert(array.octuples().elementsEqual(array.chunks(ofCount: 8), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4] &&
            $0.5 == $1[offsetBy: 5] &&
            $0.6 == $1[offsetBy: 6] &&
            $0.7 == $1[offsetBy: 7]
        }))
    }
}

private extension RandomAccessCollection {
    subscript(offsetBy distance: Int) -> Element {
        self[self.index(startIndex, offsetBy: distance)]
    }
}
