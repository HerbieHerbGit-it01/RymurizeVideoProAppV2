//
//  PolishedMenuView.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 7/19/25.
//


import SwiftUI

struct PolishedMenuView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: HowItWorksView()) {
                        Label("How It Works", systemImage: "play.circle.fill")
                    }
                    NavigationLink(destination: AboutView()) {
                        Label("About Rymurize", systemImage: "info.circle.fill")
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Label("Privacy Policy", systemImage: "lock.fill")
                    }
                }

                Section {
                    NavigationLink(destination: ContactSupportView()) {
                        Label("Contact Support", systemImage: "envelope.fill")
                    }
                    NavigationLink(destination: AppFeedbackView()) {
                        Label("Send Feedback", systemImage: "bubble.left.and.bubble.right.fill")
                    }
                }

                Section {
                    NavigationLink(destination: TermsAndConditionsView()) {
                        Label("Terms & Conditions", systemImage: "doc.plaintext.fill")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}
