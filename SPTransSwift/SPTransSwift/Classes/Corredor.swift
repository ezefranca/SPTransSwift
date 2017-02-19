import Foundation

public class Corredor: NSObject {
    
	internal let kNome: String = "Nome"
	internal let kCorredor: String = "CodCorredor"
    internal let kCodCot: String = "CodCot"

	public var nome: String?
	public var codCorredor: Int?
    public var codCot: Int?

    init(_ JSON:[String:AnyObject]) {
        self.nome = JSON[kNome] as! String?
        self.codCorredor = JSON[kCorredor] as! Int?
        self.codCot = JSON[kCodCot] as! Int?
    }
}
