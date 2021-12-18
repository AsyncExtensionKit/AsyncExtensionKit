import Foundation

public extension NSItemProvider {
  @available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
  func loadItem(forTypeIdentifier typeIdentifier: String, options: [AnyHashable: Any]? = nil) async throws -> NSSecureCoding? {
    try await withCheckedThrowingContinuation { continuation in
      loadItem(forTypeIdentifier: typeIdentifier, options: options) { secureCoding, error in
        if let error = error {
          continuation.resume(throwing: error)
        } else {
          continuation.resume(returning: secureCoding)
        }
      }
    }
  }
}
