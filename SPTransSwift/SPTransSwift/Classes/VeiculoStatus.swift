import Foundation

public class VeiculoStatus: NSObject {

	internal let kVsPxKey: String = "px"
	internal let kVsAKey: String = "a"
	internal let kVsPyKey: String = "py"
	internal let kVsPKey: String = "p"
	internal let kVsTKey: String = "t"

	public var px: Float?
	public var a: Bool = false
	public var py: Float?
	public var p: String?
	public var t: String?

}
