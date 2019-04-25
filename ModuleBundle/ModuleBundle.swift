import Foundation

/// This class must be exist in each module
/// to simplify and prevent extensive usage Bundle(for: AnyClass)
/// which has the worst performance
/// To prevent ambiguity when invoked togheter with other module
/// just prepend invocation using <MODULENAME>.ModuleBundle

/// See: ModuleOne
public class ModuleBundle {
    private init() {}
    // Cross Module usage
    public static let bundle = Bundle(for: ModuleBundle.self)
}

extension Bundle {
    // Internal usage
    static let module = ModuleBundle.bundle
}
