import Foundation

public class Parada: NSObject {

	internal let kParadaEnderecoKey: String = "Endereco"
	internal let kParadaNomeKey: String = "Nome"
	internal let kParadaLatitudeKey: String = "Latitude"
	internal let kParadaLongitudeKey: String = "Longitude"
	internal let kParadaCodigoParadaKey: String = "CodigoParada"

	public var endereco: String?
	public var nome: String?
	public var latitude: Double?
	public var longitude: Double?
	public var codigoParada: String?

    init(_ JSON:[String:AnyObject]) {
		self.endereco = JSON[kParadaEnderecoKey] as? String
		self.nome = JSON[kParadaNomeKey] as? String
		self.latitude = JSON[kParadaLatitudeKey] as? Double
		self.longitude = JSON[kParadaLongitudeKey] as? Double
		self.codigoParada = JSON[kParadaCodigoParadaKey] as? String

    }
}
