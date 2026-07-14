import Foundation

/// The GraphQL query and variable details encoded to be sent in the POST body of a HTTP request
struct GraphQLHTTPPostBody: Encodable {
    
    private let query: String
    private let variables: Encodable
    private let operationName: String?

    enum CodingKeys: CodingKey {
        case query
        case variables
        case operationName
    }

    init(query: String, variables: Encodable, operationName: String? = nil) {
        self.query = query
        self.variables = variables
        self.operationName = operationName
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.query, forKey: .query)
        try container.encode(self.variables, forKey: .variables)
        try container.encodeIfPresent(self.operationName, forKey: .operationName)
    }
}
