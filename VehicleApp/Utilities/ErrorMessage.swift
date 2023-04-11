//
//  ErrorMessage.swift
//  VehicleApp
//
//  Created by Mine Rala on 7.04.2023.
//

import Foundation


enum VAError: String, Error {
    case invalidKeyword = "Invalid keyword. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidURLLink = "Invalid link. Please check the link."
    case invalidURL = "Invalid URL."
    case checkingError = "Data couldn't be checked"
    case coreDataError = "There is a core data error, please check."
}
