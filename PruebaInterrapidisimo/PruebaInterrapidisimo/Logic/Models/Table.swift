//
//  Table.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation
import RealmSwift

struct Table: Codable, Hashable {
    let nombreTabla, pk, queryCreacion: String
    let batchSize: Int
    let filtro: String
    let numeroCampos: Int

    enum CodingKeys: String, CodingKey {
        case nombreTabla = "NombreTabla"
        case pk = "Pk"
        case queryCreacion = "QueryCreacion"
        case batchSize = "BatchSize"
        case filtro = "Filtro"
        case numeroCampos = "NumeroCampos"
    }
}

class TableRealm: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var nombreTabla: String
}
