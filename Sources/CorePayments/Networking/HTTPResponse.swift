import Foundation

@_documentation(visibility: private)
public struct HTTPResponse {
    
    public let status: Int
    public let body: Data?

    var isSuccessful: Bool { (200..<300).contains(status) }
}
