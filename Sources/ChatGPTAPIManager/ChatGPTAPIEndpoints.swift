//
//  ChatGPTAPIEndpoints.swift
//  
//
//  Created by Najam us Saqib on 7/5/23.
//

import Foundation

// MARK: - API Enum
/// Enum defining the base URL for an API.
enum ChatGPTAPIEndpoint {
    enum Domains {
        static let dev = "https://api.openai.com"
        static let production = "https://api.openai.com"
        static let qa = "https://api.openai.com"
    }
    
    enum Routes {
        static let api = "/v1"
    }
    
    private static let domain = Domains.dev
    private static let route = Routes.api
    private static let baseURL = domain + route
    
    // MARK: Base URLs
    case completion
    case chat
    case generateImage
    case imageEdits
    case translations
    case transcriptions
    case modelsList
    case retrievedModel(String)
}

extension ChatGPTAPIEndpoint {
    
    var method: String {
        switch self {
        case .completion, .chat, .generateImage, .imageEdits, .translations, .transcriptions:
            return "POST"
            
        case .modelsList, .retrievedModel:
            return "GET"
        }
    }
    
    var url: URL {
        switch self {
        case.completion:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/completions")!
        case .chat:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/chat/completions")!
        case .generateImage:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/images/generations")!
        case.imageEdits:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/images/edits")!
        case.transcriptions:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/audio/transcriptions")!
        case.translations:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/audio/translations")!
        case.modelsList:
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/models")!
        case.retrievedModel(let modelName):
            return URL(string: ChatGPTAPIEndpoint.baseURL + "/models/\(modelName)")!
        }
    }
}
