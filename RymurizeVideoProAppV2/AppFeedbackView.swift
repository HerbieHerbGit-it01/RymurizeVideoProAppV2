//
//  AppFeedbackView.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 7/19/25.
//

import SwiftUI
import MessageUI

struct AppFeedbackView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("We’d love your feedback!")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Got an idea, suggestion, or something not working? Let us know!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            if let emailURL = URL(string: "mailto:medicalmusicproducer@gmail.com") {
                Link(destination: emailURL) {
                    Label("Email Us", systemImage: "envelope.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Send Feedback")
    }
}
