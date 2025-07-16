//
//  HomeViewModel.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation

@Observable
class HomeViewModel {
    
    private var appUseCase: AppUseCaseProtocol
    private var userUseCase: UserUseCaseProtocol
    
    var receivedUser: UserRealm?

    var isNotCurrentVersion: Bool = false
    var networkError: Bool = false
    

    init(appUseCase: AppUseCaseProtocol = AppUseCase(), userUseCase: UserUseCaseProtocol = UserUseCase()) {

        self.appUseCase = appUseCase
        self.userUseCase = userUseCase
        
        getAppVersion()
        authenticateUser()
    }

    func getAppVersion() {
        Task {
            let result = await appUseCase.getAppVersion()

            switch result {
            case .success(let version):
                
                // Verifica la versión actual de la app
                let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1"
                
                self.isNotCurrentVersion = currentVersion != version
                
            case .failure:
                break
            }
        }
    }

    func authenticateUser() {
        Task {
            let result = await userUseCase.authenticateUser()
            
            switch result {
            case .success(let user):
                receivedUser = user

            case .failure(let errorResponse):
                // Si hay un problema de red modifica el booleano para mostrar alert en View
                if let error = errorResponse as? NetworkError, error == .unexpectedStatusCode {
                    networkError = true
                }
                
            }
        }
    }
    
    
}
