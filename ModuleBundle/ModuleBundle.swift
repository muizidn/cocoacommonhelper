import Foundation

public class ModuleBundle {
    private init() {}
    public static let bundle = Bundle(for: ModuleBundle.self)
}
