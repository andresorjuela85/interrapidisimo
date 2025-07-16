//
//  LocalidadesView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import SwiftUI

struct LocalidadesView: View {
    
    @State var viewModel = LocalidadesViewModel()
    
    var body: some View {

        VStack {
            List(viewModel.localidades, id: \.self) { localidad in
                NavigationLink {
                    LocalidadDetailView(localidad: localidad)
                } label: {
                    LocalidadView(shortName: localidad.abreviacionCiudad, fullName: localidad.nombreCompleto)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("LOCALIDADES")
        .toolbarRole(.editor)
        .task {
            viewModel.getLocalidades()
        }
    }
}

#Preview {
    LocalidadesView()
}
