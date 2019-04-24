import UIKit

protocol NibFileCompanion {}
extension NibFileCompanion {
    @inlinable
    init?(index: Int,
          options: [UINib.OptionsKey: Any]? = nil,
          bundle: Bundle = .main) {
        let nib = UINib(nibName: String(describing: Self.self), bundle: bundle)
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
    init?(nibInBundle bundle: Bundle) {
        self.init(index: 0, bundle: bundle)
    }
    
    public static func fromNib(bundle: Bundle = .main) -> Self? {
        return Self.init(nibInBundle: bundle)
    }
    
    public static func withOwner<T>(
        _ owner: T.Type,
        index: Int = 0,
        options: [UINib.OptionsKey: Any]? = nil,
        bundle: Bundle = .main
        ) -> T? {
        let nib = UINib(nibName: String(describing: Self.self), bundle: bundle)
        let items = nib.instantiate(withOwner: owner, options: options)
        #if DEBUG
        if index >= items.count { fatalError("items.count \(items.count)") }
        #endif
        let object = items[index] as? T
        return object
    }
}
