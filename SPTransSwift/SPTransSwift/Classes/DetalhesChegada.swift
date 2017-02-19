import Foundation

public class DetalhesChegada: NSObject {

	internal let kParadaLinhaChegadaCpKey: String = "cp"
	internal let kParadaLinhaChegadaPxKey: String = "px"
	internal let kParadaLinhaChegadaNpKey: String = "np"
	internal let kParadaLinhaChegadaLKey: String = "l"
	internal let kParadaLinhaChegadaPyKey: String = "py"

	public var cp: Int?
	public var px: Double?
	public var np: String?
	public var localizacao: [Localizacao]?
	public var py: Double?

}
