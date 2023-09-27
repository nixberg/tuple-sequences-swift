import Algorithms
import TupleSequences
import XCTest

final class TupleSequencesTests: XCTestCase {
    private let array = Array(0..<840)
    
    func testCouples() {
        let sequence = array.couples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 2)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 2), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1]
        }))
    }
    
    func testTriples() {
        let sequence = array.triples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 3)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 3), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2]
        }))
    }
    
    func testQuadruples() {
        let sequence = array.quadruples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 4)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 4), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3]
        }))
    }
    
    func testQuintuples() {
        let sequence = array.quintuples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 5)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 5), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4]
        }))
    }
    
    func testSextuples() {
        let sequence = array.sextuples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 6)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 6), by: {
            $0.0 == $1[offsetBy: 0] &&
            $0.1 == $1[offsetBy: 1] &&
            $0.2 == $1[offsetBy: 2] &&
            $0.3 == $1[offsetBy: 3] &&
            $0.4 == $1[offsetBy: 4] &&
            $0.5 == $1[offsetBy: 5]
        }))
    }
    
    func testSeptuples() {
        let sequence = array.septuples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 7)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 7), by: {
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
        let sequence = array.octuples()
        
        XCTAssertEqual(sequence.underestimatedCount, array.underestimatedCount / 8)
        
        XCTAssert(sequence.elementsEqual(array.chunks(ofCount: 8), by: {
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

extension RandomAccessCollection {
    fileprivate subscript(offsetBy distance: Int) -> Element {
        self[self.index(startIndex, offsetBy: distance)]
    }
}
