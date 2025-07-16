//
//  TableView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import SwiftUI

struct TableView: View {
    
    var viewModel = TableViewModel()
    
    var body: some View {
        
        if viewModel.isLoading {
         LoaderView()
        } else {
            List(viewModel.tablas, id: \.self) { tabla in
                Text(tabla.nombreTabla)
                    .padding(.vertical)
            }
            .navigationTitle("TABLAS")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
            .task {
                viewModel.getTable()
            }
        }
    }
}

#Preview {
    TableView()
}
