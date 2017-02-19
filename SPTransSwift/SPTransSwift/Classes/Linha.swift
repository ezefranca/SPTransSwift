import Foundation

public class Linha: NSObject {

	internal let kLinhaDenominacaoTPTSKey: String = "DenominacaoTPTS"
	internal let kLinhaLetreiroKey: String = "Letreiro"
	internal let kLinhaCircularKey: String = "Circular"
	internal let kLinhaCodigoLinhaKey: String = "CodigoLinha"
	internal let kLinhaTipoKey: String = "Tipo"
	internal let kLinhaDenominacaoTSTPKey: String = "DenominacaoTSTP"
	internal let kLinhaInformacoesKey: String = "Informacoes"
	internal let kLinhaSentidoKey: String = "Sentido"

	/// Informa o letreiro descritivo da linha no sentido Terminal Principal para Terminal Secundário
	public var denominacaoTPTS: String?
	/// Informa a primeira parte do letreiro numérico da linha
	public var letreiro: String?
	/// Indica se uma linha opera no modo circular (sem um terminal secundário)
	public var circular: Bool = false
	/// Código identificador da linha. Este é um código identificador único de cada linha do sistema (por sentido)
	public var codigoLinha: Int?
    /// Informa a segunda parte do letreiro numérico da linha, que indica se a linha opera nos modos: BASE (10), ATENDIMENTO (21, 23, 32, 41)
	public var tipo: Int?
	/// Informa o letreiro descritivo da linha no sentido Terminal Secundário para Terminal Principal
	public var denominacaoTSTP: String?
    /// Retorna informações cadastrais detalhadas sobre a linha, como por exemplo: Horário de operação, dia de operação (útil, sábados ou domingos, extensão (em metros)
	public var informacoes: String?
	/// Informa o sentido ao qual a linha atende, onde 1 significa Terminal Principal para Terminal Secundário e 2 para Terminal Secundário para Terminal Principal
	public var sentido: Int?
    
    init(_ JSON:[String:AnyObject]) {
        
        guard let denominacaoTPTS = JSON[kLinhaDenominacaoTPTSKey] as? String?,
            let letreiro = JSON[kLinhaLetreiroKey] as? String?,
            let circular = JSON[kLinhaCircularKey] as? Bool,
            let codigoLinha = JSON[kLinhaCodigoLinhaKey] as? Int?,
            let tipo = JSON[kLinhaTipoKey] as? Int?,
            let denominacaoTSTP = JSON[kLinhaDenominacaoTSTPKey] as? String?,
            let sentido = JSON[kLinhaSentidoKey] as? Int?
            else { return }

        self.denominacaoTSTP = denominacaoTSTP
        self.letreiro = letreiro
        self.circular = circular
        self.codigoLinha = codigoLinha
        self.tipo = tipo
        self.denominacaoTSTP = denominacaoTSTP
        self.sentido = sentido
        
        guard let info = JSON[kLinhaInformacoesKey] as? String
        else {
            self.informacoes = ""
            return
        }
        self.informacoes = info as! String
    }
}
