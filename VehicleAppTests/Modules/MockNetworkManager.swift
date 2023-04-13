//
//  MockNetworkManager.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 11.04.2023.

@testable import VehicleApp

final class MockNetworkManager: NetworkManagerProtocol {
    var invokeMakeRequest = false
    var invokeMakeRequestCount = 0
    var invokeMakeRequesSuccess = false
    var invokeMakeRequestSuccessCount = 0
    
    func makeRequest<T>(endpoint: VehicleApp.Endpoint, type: T.Type, completed: @escaping (Result<T, VehicleApp.VAError>) -> Void) where T : Decodable {
        invokeMakeRequest = true
        invokeMakeRequestCount += 1
       // completed(Result<T, MovieError>)
     //   completed(.success(T.self as! T))
        invokeMakeRequesSuccess = true
        invokeMakeRequestSuccessCount += 1
    }

}
