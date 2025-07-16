//
//  LocalidadView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import SwiftUI

struct LocalidadView: View {
    
    var shortName: String
    var fullName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
                Text("Nombre:")
                    .fontWeight(.semibold)
                Text(fullName)

            Spacer()
                .frame(height: 15)

                Text("Abreviación:")
                    .fontWeight(.semibold)
                Text(shortName)
        }
        .padding()
    }
}

#Preview {
    LocalidadView(shortName: "", fullName: "")
}
