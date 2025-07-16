//
//  LocalidadDetailView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import SwiftUI

//Pantalla de detalle para Localidad
struct LocalidadDetailView: View {
    
    var localidad: LocalidadRealm
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 10) {
                Text(localidad.nombreCorto)
                    .font(.title)
                    .fontWeight(.bold)
                Text(localidad.nombreAncestroPGrado)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Text("Id localidad: ")
                        .fontWeight(.semibold)
                    Text(localidad.idLocalidad)
                }
                HStack {
                    Text("Codigo postal: ")
                        .fontWeight(.semibold)
                    Text(localidad.codigoPostal)
                }
                if let indicativo = localidad.indicativo {
                    HStack {
                        Text("Indicativo: ")
                            .fontWeight(.semibold)
                        Text(indicativo)
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                if localidad.permiteRecogida {
                    Text("Permite recogida")
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack {
                        Text("Precio de recogida: ")
                            .fontWeight(.semibold)
                        Text("$ \(String(localidad.valorRecogida ?? 0))")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .toolbarRole(.editor)
    }
}

#Preview {
    LocalidadDetailView(
        localidad: LocalidadRealm()
    )
}
