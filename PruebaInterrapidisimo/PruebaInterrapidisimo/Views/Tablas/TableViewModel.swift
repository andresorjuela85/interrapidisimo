//
//  TableViewModel.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import Foundation

@Observable
class TableViewModel {
    
    private var tableUseCase: TableUseCaseProtocol
    
    var tablas: [TableRealm] = []
    var isLoading: Bool = false
    
    init(tableUseCase: TableUseCaseProtocol = TableUseCase()) {
        self.tableUseCase = tableUseCase
    }
    
    func getTable() {
        
        Task {
            isLoading = true
            let result = await tableUseCase.getTable()
            
            switch result {
            case .success(let receivedTable):
                tablas = receivedTable
            case .failure:
                break
            }
            isLoading = false
        }
    }
}
