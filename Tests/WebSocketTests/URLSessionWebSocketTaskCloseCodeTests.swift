import XCTest
import WebSocketProtocol
@testable import WebSocket

class URLSessionWebSocketTaskCloseCodeTests: XCTestCase {
    func testCanInitializeURLSessionWebSocketTaskCloseCode() throws {
        let urlSessionCloseCodes: [URLSessionWebSocketTask.CloseCode] = [
            .invalid, .normalClosure, .goingAway, .protocolError, .unsupportedData,
            .noStatusReceived, .abnormalClosure, .invalidFramePayloadData, .policyViolation,
            .messageTooBig, .mandatoryExtensionMissing, .internalServerError, .tlsHandshakeFailure,
        ]

        let closeCodes: [WebSocketCloseCode] = [
            .invalid, .normalClosure, .goingAway, .protocolError, .unsupportedData,
            .noStatusReceived, .abnormalClosure, .invalidFramePayloadData, .policyViolation,
            .messageTooBig, .mandatoryExtensionMissing, .internalServerError, .tlsHandshakeFailure,
        ]

        zip(urlSessionCloseCodes, closeCodes).forEach { (urlSessionCloseCode, closeCode) in
            XCTAssertEqual(urlSessionCloseCode, URLSessionWebSocketTask.CloseCode(closeCode))
        }
    }

    func testAllWebSocketCloseCodesHaveCorrespondingURLSessionCloseCodes() throws {
        WebSocketCloseCode.allCases.forEach { XCTAssertNotNil(URLSessionWebSocketTask.CloseCode($0)) }
    }
}
