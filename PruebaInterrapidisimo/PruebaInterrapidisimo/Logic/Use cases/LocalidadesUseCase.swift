//
//  LocalidadesUseCase.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import Foundation
import RealmSwift

protocol LocalidadesUserCaseProtocol {
    func getLocalidades() async -> Result<[LocalidadRealm], Error>
}

// casos de uso para el manejo de localidades
class LocalidadesUseCase: LocalidadesUserCaseProtocol {
    
    private let service: ServiceProtocol
    private let realm: Realm?
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
        self.realm = try? Realm()
    }
    
    @MainActor
    func getLocalidades() async -> Result<[LocalidadRealm], Error> {
        
        //Lee las localidades desde BD, si no existe el elemento lo hace desde service
        if let localidades = realm?.objects(LocalidadRealm.self), !localidades.isEmpty {
            return .success(Array(localidades))
        } else {
            let response = await service.sendRequest(urlString: ServiceConstants.Endpoints.getLocalidades.rawValue,
                                                     method: .get,
                                                     body: nil,
                                                     headers: [:],
                                                     responseType: [Localidad].self)
            
            switch response {
            case .success(let response):

                var localidades: [LocalidadRealm] = []

                //Crea objeto localidades en BD
                for localidadResponse in response {
                    let localidad = LocalidadRealm()
                    localidad.idLocalidad = localidadResponse.idLocalidad
                    localidad.nombre = localidadResponse.nombre
                    localidad.nombreCorto = localidadResponse.nombreCorto
                    localidad.nombreAncestroPGrado = localidadResponse.nombreAncestroPGrado
                    localidad.nombreCompleto = localidadResponse.nombreCompleto
                    localidad.codigoPostal = localidadResponse.codigoPostal
                    localidad.indicativo = localidadResponse.indicativo
                    localidad.permiteRecogida = localidadResponse.permiteRecogida
                    localidad.valorRecogida = localidadResponse.valorRecogida
                    localidad.abreviacionCiudad = localidadResponse.abreviacionCiudad
                    
                    try? realm?.write {
                        realm?.add(localidad)
                    }

                    localidades.append(localidad)
                }

                return .success(localidades)
            case .failure(let error):
                return .failure(error)
            }
        }
    }
}
