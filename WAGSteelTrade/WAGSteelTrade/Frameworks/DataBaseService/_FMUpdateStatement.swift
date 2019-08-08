import GRDBCipher

@objc public class _FMUpdateStatement : NSObject {
    private let db: FMDatabase
    private let statement: UpdateStatement
    
    @objc public var sqliteHandle: OpaquePointer {
        return statement.sqliteStatement
    }
    
    init(database: FMDatabase, statement: UpdateStatement) {
        self.db = database
        self.statement = statement
    }
    
    // TODO: is it FMDB API? Shouldn't values be optional, then?
    @objc public func execute(values: [Any]) throws {
        do {
            try statement.execute(arguments: db.statementArguments(from: values))
        } catch {
            throw db.handleError(error)
        }
    }
}
