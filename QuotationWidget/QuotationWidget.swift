//
//  QuotationWidget.swift
//  LiveActivityExample
//
//  Created by Ivan Morgun on 11.11.2023.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct QuotationWidgetView : View {
    let context: ActivityViewContext<QuotationAttributes>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(context.state.quotation.quiotation)
            HStack {
                Spacer()
                Text(context.state.quotation.author).font(.caption)
            }
        }
        .padding()
        .activityBackgroundTint(Color.cyan)
        .activitySystemActionForegroundColor(Color.black)
    }
}

struct QuotationWidget: Widget {
    let kind: String = "QuotationWidget"

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: QuotationAttributes.self) { context in
            QuotationWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("M")
            }
        }
    }
}
