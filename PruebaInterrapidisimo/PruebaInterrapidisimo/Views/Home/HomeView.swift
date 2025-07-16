//
//  HomeView.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("HOME")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nombre de usuario:")
                        .fontWeight(.semibold)
                    Text(viewModel.receivedUser?.usuario ?? "")
                        .font(.title3)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    if let identificacion = viewModel.receivedUser?.identificacion {
                        Text("Identificación:")
                            .fontWeight(.semibold)
                        Text(identificacion)
                            .font(.title3)
                    }
                    
                    if let nombre = viewModel.receivedUser?.nombre {
                        Text("Nombre:")
                            .fontWeight(.semibold)
                        Text(nombre)
                            .font(.title3)
                        
                    }
                    
                    if let apellido = viewModel.receivedUser?.apellido1 {
                        Text("Apellido:")
                            .fontWeight(.semibold)
                        Text(apellido)
                            .font(.title3)
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TableView()) {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .foregroundColor(.orange)
                                .cornerRadius(15)
                            
                            Text("TABLAS")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    NavigationLink(destination: LocalidadesView()) {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .foregroundColor(.orange)
                                .cornerRadius(15)
                            
                            Text("LOCALIDADES")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .alert("Fallo de red.", isPresented: $viewModel.networkError) {
                    Button("OK", role: .cancel) { }
                    
                } message: {
                    //
                }
                .alert("Versión antigua.", isPresented: $viewModel.isNotCurrentVersion) {
                    Button("OK", role: .cancel) { }
                    
                } message: {
                    Text("Actualizar a la última versión de la app.")
                }
            }
            
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .tint(.black)
    }
}

#Preview {
    HomeView()
}
