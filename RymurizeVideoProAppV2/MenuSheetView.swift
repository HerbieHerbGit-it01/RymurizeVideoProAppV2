//
//  MenuSheetView.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 7/3/25.
//

import SwiftUI

struct MenuSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            Text("📚 Welcome to Rymurize")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            
            ScrollView {
                Text("Research shows that watching a video all the way through helps reinforce key concepts.\n\nTaking a short quiz afterward can boost your memory recall.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 4)
            }
            .frame(height: 140)
            
            Divider()
            
            // 🧠 Take a Quiz button
            Button(action: {
                // Action for quiz
            }) {
                HStack {
                    Text("Take a Quiz")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                // Action for how it works
            }) {
                HStack {
                    Text("How It Works")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            // 📼 Browse Videos button
            Button(action: {
                // Action for browsing videos
            }) {
                HStack {
                    Text("Browse Videos")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            // ❓ What’s the Quiz? button
            Button(action: {
                // Action for quiz explanation
            }) {
                HStack {
                    Text("What’s the Quiz?")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            // 📊 My Progress button (placeholder for future features)
            Button(action: {
                // Action for future progress tracking
            }) {
                HStack {
                    Text("📊 My Progress (Coming Soon)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            // ⚙️ Settings button
            Button(action: {
                // Action for settings
            }) {
                HStack {
                    Text("⚙️ Settings")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            // 📩 Contact Support button
            Button(action: {
                // Action for contacting support
            }) {
                HStack {
                    Text("Contact Support")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
    }
}
