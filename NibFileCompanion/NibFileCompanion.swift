import UIKit

/// Conformed to type which name represent Nib file.
/// e.g CustomView.xib => class CustomView
protocol NibFileCompanion {
    static var bundle: Bundle { get }
}

extension NibFileCompanion {
    @inlinable
    init?(index: Int,
          options: [UINib.OptionsKey: Any]? = nil) {
        let nib = UINib(nibName: String(describing: Self.self), bundle: Self.bundle)
        let items = nib.instantiate(withOwner: Self.self, options: options)
        #if DEBUG
        if index >= items.count { fatalError("items.count \(items.count)") }
        #endif
        // We don't make bounds checking because it must be client error
        if let _self = items[index] as? Self {
            self = _self
        } else {
            return nil
        }
    }
    
    @inlinable
    public static func fromNib() -> Self? {
        return Self.init(index: 0)
    }
    
    @inlinable
    public static func withOwner<T>(
        _ owner: T.Type,
        index: Int = 0,
        options: [UINib.OptionsKey: Any]? = nil
        ) -> T? {
        let nib = UINib(nibName: String(describing: Self.self), bundle: Self.bundle)
        let items = nib.instantiate(withOwner: owner, options: options)
        #if DEBUG
        if index >= items.count { fatalError("items.count \(items.count)") }
        #endif
        let object = items[index] as? T
        return object
    }
}
