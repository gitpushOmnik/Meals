//
//  MealsAPIError.swift
//  Meals
//
//  Created by Omkar Nikhal on 3/28/24.
//

import Foundation

/// An enumeration representing possible errors encountered during meals API operations.
enum MealsAPIError: Error {
    
    /// Error indicating that an empty response was received.
    case emptyResponse
    
    /// Error indicating that an invalid URL was provided.
    case invalidURL
    
    /// Error indicating that the request failed with a specific error message.
    case requestFailed(message: String)

    var description: String {
        switch self {
        case .emptyResponse:
            return "MealsAPI Error: Empty response received."
        case .invalidURL:
            return "MealsAPI Error: Invalid URL."
        case .requestFailed(let message):
            return "MealsAPI Error: Request failed with status code Message: \(message)"
        }
    }
}
