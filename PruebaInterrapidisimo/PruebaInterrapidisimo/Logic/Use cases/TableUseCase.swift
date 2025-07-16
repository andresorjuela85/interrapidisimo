//
//  TableUseCase.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation
import RealmSwift

protocol TableUseCaseProtocol {
    func getTable() async -> Result<[TableRealm], Error>
}

//Casos de usos para las tablas
class TableUseCase: TableUseCaseProtocol {

    private var service: ServiceProtocol
    private var realm: Realm?

    init(service: ServiceProtocol = Service()) {
        self.service = service
        self.realm = try? Realm()
    }

    @MainActor
    func getTable() async -> Result<[TableRealm], Error> {
        
        //Leer tables desde base de datos, si no existe lo hace desde service
        if let tables = realm?.objects(TableRealm.self), !tables.isEmpty {
            return .success(Array(tables))
        } else {
            let response = await service.sendRequest(urlString: ServiceConstants.Endpoints.getScheme.rawValue,
                                             method: .get,
                                             body: nil,
                                             headers: ServiceConstants.httpHeaders,
                                             responseType: [Table].self)
            
            switch response {
            case .success(let response):

                var tables: [TableRealm] = []

                //Crea un objeto table en la BD
                for tableResponse in response {
                    let table = TableRealm()
                    table.nombreTabla = tableResponse.nombreTabla

                    try? realm?.write {
                        realm?.add(table)
                    }

                    tables.append(table)
                }

                return .success(tables)
            case .failure(let error):
                return .failure(error)
            }
        }
    }
}
