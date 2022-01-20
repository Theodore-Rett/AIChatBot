//
//  ResponseGenerator.swift
//  AIChatBot
//
//  Created by Paige Keller on 1/19/22.
//

import Foundation

class ResponseGenerator {
    
    var likesArray: [[String]] = []
    
    
    func genResponse(array: [Substring]) -> String {
        var aiResponse = ""
        
        if array.count == 1 && likesArray.count == 0 {
            aiResponse = "Hello, please be more specific!"
        }
        
        
        
        
        
        return aiResponse
    }
    
    
    
}
