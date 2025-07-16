//
//  UserUseCase.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation
import RealmSwift

protocol UserUseCaseProtocol {
    func authenticateUser() async -> Result<UserRealm, Error>
}

class UserUseCase: UserUseCaseProtocol {

    private var service: ServiceProtocol
    private var realm: Realm?

    init(service: ServiceProtocol = Service()) {
        self.service = service
        self.realm = try? Realm()
    }

    @MainActor
    func authenticateUser() async -> Result<UserRealm, Error> {
        
        //Leer user desde base de datos, si no existe lo hace desde service
        if let user = realm?.objects(UserRealm.self).first {
            return .success(user)
        } else {
            let response = await service.sendRequest(urlString: ServiceConstants.Endpoints.auth.rawValue,
                                             method: .post,
                                             body: ServiceConstants.authBodyRequest,
                                             headers: ServiceConstants.httpHeaders,
                                             responseType: User.self)
            
            switch response {
            case .success(let response):
                
                //Crea un objeto user en la BD
                let user = UserRealm()
                user.usuario = response.usuario
                user.identificacion = response.identificacion
                user.nombre = response.nombre
                user.apellido1 = response.apellido1
                
                try? realm?.write {
                    realm?.add(user)
                }
                
                return .success(user)
            
            case . failure(let error):
                return .failure(error)
                
            }
        }
    }
}

