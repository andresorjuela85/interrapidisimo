//
//  Localidad.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import Foundation
import RealmSwift

struct Localidad: Codable, Hashable {
    let idLocalidad, idTipoLocalidad, idAncestroPGrado, idAncestroSGrado: String
    let nombre, nombreCorto, nombreAncestroPGrado, nombreCompleto: String
    let codigoPostal: String
    let indicativo: String?
    let idCentroServicio, estadoRegistro: Int
    let permiteRecogida: Bool
    let valorRecogida: Int
    let abreviacionCiudad: String
    
    enum CodingKeys: String, CodingKey {
        case idLocalidad = "IdLocalidad"
        case idTipoLocalidad = "IdTipoLocalidad"
        case idAncestroPGrado = "IdAncestroPGrado"
        case idAncestroSGrado = "IdAncestroSGrado"
        case nombre = "Nombre"
        case nombreCorto = "NombreCorto"
        case nombreAncestroPGrado = "NombreAncestroPGrado"
        case nombreCompleto = "NombreCompleto"
        case codigoPostal = "CodigoPostal"
        case indicativo = "Indicativo"
        case idCentroServicio = "IdCentroServicio"
        case estadoRegistro = "EstadoRegistro"
        case permiteRecogida = "PermiteRecogida"
        case valorRecogida = "ValorRecogida"
        case abreviacionCiudad = "AbreviacionCiudad"
    }
}

class LocalidadRealm: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var idLocalidad: String
    @Persisted var nombre: String
    @Persisted var nombreCorto: String
    @Persisted var nombreAncestroPGrado: String
    @Persisted var nombreCompleto: String
    @Persisted var codigoPostal: String
    @Persisted var indicativo: String?
    @Persisted var permiteRecogida: Bool
    @Persisted var valorRecogida: Int?
    @Persisted var abreviacionCiudad: String
}

