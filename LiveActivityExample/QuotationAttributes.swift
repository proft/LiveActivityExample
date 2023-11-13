//
//  QuotationAttributes.swift
//  LiveActivityExample
//
//  Created by Ivan Morgun on 11.11.2023.
//

import ActivityKit
import SwiftUI

// Data

struct Quotation: Codable, Hashable {
    let quiotation: String
    let author: String
    
    static func preview() -> [Quotation] {
        return [
            Quotation(quiotation: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
            Quotation(quiotation: "If you can dream it, you can do it.", author: "Walt Disney"),
            Quotation(quiotation: "Success is not final, failure is not fatal: it is the courage to continue that counts.", author: "Winston Churchill"),
            Quotation(quiotation: "The pessimist complains about the wind. The optimist expects it to change. The leader adjusts the sails.", author: "John Maxwell"),
            Quotation(quiotation: "It is amazing what you can accomplish if you do not care who gets the credit.", author: " Harry Truman")
        ]
    }
    
    static func random() -> Quotation {
        preview().randomElement()!
    }
}

// Attributes

struct QuotationAttributes: ActivityAttributes {
    // Dynamic values
    public struct ContentState: Codable, Hashable {
        var quotation: Quotation
    }
    
    // Static values
    var quotationName: String
}
