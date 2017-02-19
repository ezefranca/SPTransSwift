import Foundation

public class Localizacao: NSObject {

	internal let kLSlKey: String = "sl"
	internal let kLCKey: String = "c"
	internal let kLClKey: String = "cl"
	internal let kLVsKey: String = "vs"
	internal let kLLt1Key: String = "lt1"
	internal let kLLt0Key: String = "lt0"
	internal let kLQvKey: String = "qv"
    
	public var sl: Int?
	public var c: String?
	public var codigolinha: Int?
	public var vs: [VeiculoStatus]?
	public var denominacaoTSTP: String?
	public var denominacaoTPTS: String?
	public var quantidadeVeiculos: Int?

}
