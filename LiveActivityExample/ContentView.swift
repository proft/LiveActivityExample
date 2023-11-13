//
//  ContentView.swift
//  LiveActivityExample
//
//  Created by Ivan Morgun on 11.11.2023.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var activity: Activity<QuotationAttributes>? = nil
    
    var body: some View {
        VStack {
            Button("Start") {
                start()
            }

            Button("Update") {
                update()
            }
            
            Button("Stop") {
                stop()
            }
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
    }
    
    func start() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled")
            return
        }
        
        let attributes = QuotationAttributes(quotationName: "Motivation")
        let quotation = Quotation.random()
        let state = QuotationAttributes.ContentState(quotation: quotation)
        
        activity = try? Activity<QuotationAttributes>.request(attributes: attributes, content: .init(state: state, staleDate: nil), pushType: nil)
    }
    
    func stop() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled")
            return
        }
        
        let quotation = Quotation.random()
        let state = QuotationAttributes.ContentState(quotation: quotation)

        Task {
            await activity?.end(.init(state: state, staleDate: nil), dismissalPolicy: .immediate)
        }
    }
    
    func update() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled")
            return
        }
        
        let quotation = Quotation.random()
        let state = QuotationAttributes.ContentState(quotation: quotation)

        Task {
            await activity?.update(.init(state: state, staleDate: nil, relevanceScore: 0))
        }
    }
}
