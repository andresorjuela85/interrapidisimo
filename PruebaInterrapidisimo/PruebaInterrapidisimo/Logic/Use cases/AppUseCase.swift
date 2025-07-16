//
//  AppUseCase.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation

protocol AppUseCaseProtocol {
    func getAppVersion() async -> Result<String, Error>
}


// Caso de uso para configuraciones, versiones, información de la aplicación
class AppUseCase: AppUseCaseProtocol {

    private var service: ServiceProtocol

    init(service: ServiceProtocol = Service()) {
        self.service = service
    }

    func getAppVersion() async -> Result<String, Error> {
        return await service.sendRequest(urlString: ServiceConstants.Endpoints.appVersion.rawValue,
                                         method: .get,
                                         body: nil,
                                         headers: [:],
                                         responseType: String.self)
    }
}
