//
//  LoaderView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 15/07/25.
//

import SwiftUI

// Vista que se muestra mientras se hace el llamado de los servicios.
struct LoaderView: View {
    var body: some View {
        
        ProgressView()
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoaderView()
}
