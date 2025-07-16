//
//  User.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation
import RealmSwift

struct User: Codable {
    let usuario: String
    let identificacion: String?
    let nombre: String?
    let apellido1: String?
    let apellido2: String?
    let cargo: String?
    let aplicaciones: String?
    let ubicaciones: String?
    let mensajeResultado: Int
    let idLocalidad: String?
    let nombreLocalidad: String?
    let nomRol: String?
    let idRol: String?
    let tokenJWT: String?
    let modulosApp: String?

    enum CodingKeys: String, CodingKey {
        case usuario = "Usuario"
        case identificacion = "Identificacion"
        case nombre = "Nombre"
        case apellido1 = "Apellido1"
        case apellido2 = "Apellido2"
        case cargo = "Cargo"
        case aplicaciones = "Aplicaciones"
        case ubicaciones = "Ubicaciones"
        case mensajeResultado = "MensajeResultado"
        case idLocalidad = "IdLocalidad"
        case nombreLocalidad = "NombreLocalidad"
        case nomRol = "NomRol"
        case idRol = "IdRol"
        case tokenJWT = "TokenJWT"
        case modulosApp = "ModulosApp"
    }
}

class UserRealm: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var usuario: String
    @Persisted var identificacion: String?
    @Persisted var nombre: String?
    @Persisted var apellido1: String?
}

