//
//  Service.swift
//  PruebaInterrapidisimo
//
//  Created by Andres Camilo Orjuela Hurtado on 14/07/25.
//

 import Foundation

 protocol ServiceProtocol: AnyObject {
     func sendRequest<T: Codable>(urlString: String,
                                  method: HTTPMethod,
                                  body: BodyRequest?,
                                  headers: [String: String],
                                  responseType: T.Type) async -> Result<T, Error>
 }

 class Service: ServiceProtocol {
     func sendRequest<T: Codable>(urlString: String,
                                  method: HTTPMethod,
                                  body: BodyRequest?,
                                  headers: [String: String],
                                  responseType: T.Type) async -> Result<T, Error> {
         // Construir URL
         guard let url = URL(string: urlString) else {
             return .failure(NetworkError.invalidURL)
         }

         var request = URLRequest(url: url)
         request.httpMethod = method.rawValue

         // Añadir headers
         for (key, value) in headers {
             request.setValue(value, forHTTPHeaderField: key)
         }

         // Codifica el Body si el metodo es POST
         if method == .post {
             if let body = body {
                 do {
                     request.httpBody = try JSONEncoder().encode(body)
                 } catch {
                     return .failure(error)
                 }
             }
         }

         // Realiza la solicitud
         do {
             let (data, response) = try await URLSession.shared.data(for: request)

             guard let httpResponse = response as? HTTPURLResponse else {
                 return .failure(NetworkError.invalidResponse)
             }

             guard httpResponse.statusCode == 200 else {
                 return .failure(NetworkError.unexpectedStatusCode)
             }

             let decoded = try JSONDecoder().decode(T.self, from: data)
             return .success(decoded)
         } catch {
             return .failure(error)
         }
     }
 }
 
