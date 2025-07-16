//
//  ServiceConstants.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case unexpectedStatusCode
}

struct BodyRequest: Codable {
    let Mac: String
    let NomAplicacion: String
    let Password: String
    let Path: String
    let Usuario: String
}

struct ServiceConstants {
    static let authBodyRequest = BodyRequest(Mac: "",
                                             NomAplicacion: "Controller APP",
                                             Password: "SW50ZXIyMDIx\n",
                                             Path: "",
                                             Usuario: "cGFtLm1lcmVkeTIx\n")

    static let httpHeaders: [String: String] = ["Content-Type": "application/json",
                                                "Accept": "text/json",
                                                "Usuario": "pam.meredy21",
                                                "Identificacion": "987204545",
                                                "IdUsuario": "pam.meredy21",
                                                "IdCentroServicio": "1295",
                                                "NombreCentroServicio": "PTO/BOGOTA/CUND/COL/OF PRINCIPAL - CRA 30 # 7-45",
                                                "IdAplicativoOrigen": "9"]

    enum Endpoints: String {
        case appVersion = "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ConsultarParametrosFramework/VPStoreAppControl"
        case auth = "https://apitesting.interrapidisimo.co/FtEntregaElectronica/MultiCanales/ApiSeguridadPruebas/api/Seguridad/AuthenticaUsuarioApp"
        case getScheme = "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/SincronizadorDatos/ObtenerEsquema/true"
        case getLocalidades = "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
    }
}
