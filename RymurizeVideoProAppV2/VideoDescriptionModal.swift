//
//  VideoDescriptionModal.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 7/1/25.
//


import SwiftUI

struct VideoDescriptionModal: View {
    let title: String
    let description: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text(title)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.top)

                    Divider()
                        .background(Color.white.opacity(0.3))

                    Text(description)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                }
                .padding(.horizontal)
            }
            .background(Color.black.opacity(0.95))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}
