//
//  CSError.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation

enum CSError : String,Error {
    
    case unableToComplete = "Unable to completed your request. Please check your internet connection."
    case invailedResponse = "Invalid response from the server.Please try again"
    case invailedData = "The data received from the server was invailed. Please try again."
}
