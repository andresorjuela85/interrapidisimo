//
//  LocalidadesViewModel.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import Foundation

@Observable
class LocalidadesViewModel {
    
    private var service: ServiceProtocol
    private var localidadesUseCase: LocalidadesUserCaseProtocol
    
    var localidades: [LocalidadRealm] = []
    
    init(service: ServiceProtocol = Service(), localidadesUseCase: LocalidadesUserCaseProtocol = LocalidadesUseCase()) {
        self.service = service
        self.localidadesUseCase = localidadesUseCase
    }
    
    func getLocalidades() {
        
        Task {
            let result = await localidadesUseCase.getLocalidades()
            
            switch result {
            case .success(let receivedLocalidades):
                localidades = receivedLocalidades
            case .failure:
                break
            }
        }
    }
}
