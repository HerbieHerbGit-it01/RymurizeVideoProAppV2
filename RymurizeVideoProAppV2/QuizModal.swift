import SwiftUI

/// Simple model for each quiz question
struct QuizQuestion {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
    let explanation: String? // 🔥 Add this line
}

struct QuizModalView: View {
    let questions: [QuizQuestion]
    var onQuizComplete: () -> Void
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var hasStartedQuiz = false
    @State private var showResults = false
    @State private var correctAnswers = 0
    @State private var showReviewSheet = false
    @State private var userAnswers: [Int] = []
    
    var body: some View {
        NavigationView {
            if showResults {
                // ✅ Final Results Screen
                ScrollView {
                    VStack(spacing: 20) {
                        if correctAnswers == questions.count {
                            VStack(spacing: 16) {
                                Text("🎯 Awesome!")
                                    .font(.largeTitle)
                                Text("You’re on a roll!")
                                    .font(.title2)
                                Button("Close") {
                                    onQuizComplete()
                                }
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        } else {
                            VStack(spacing: 16) {
                                Text("💪 Keep pushing!")
                                    .font(.largeTitle)
                                    .foregroundColor(.orange)
                                    .multilineTextAlignment(.center)

                                Text("Want to give it another shot?")
                                    .font(.body)
                                    .multilineTextAlignment(.center)

                                Text("Your Score: \(Int((Double(correctAnswers) / Double(questions.count)) * 100))%")
                                    .font(.title2)
                                    .padding(.top, 8)

                            HStack(spacing: 20) {
                                Spacer()

                                Button(action: {
                                    currentQuestionIndex = 0
                                    selectedAnswer = nil
                                    correctAnswers = 0
                                    showResults = false
                                    hasStartedQuiz = false
                                    userAnswers = []
                                }) {
                                    Text("Retry")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 44)
                                        .background(Color.orange)
                                        .cornerRadius(10)
                                }

                                Button(action: {
                                    onQuizComplete()
                                }) {
                                    Text("Close")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 44)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                }

                                Spacer()
                            }
                            .padding(.top, 8)
                            }
                            .onAppear {
                                showReviewSheet = true
                            }
                        }
                    }
                    .padding()
                }
                .sheet(isPresented: $showReviewSheet) {
                    // Use the same final score that’s already calculated
                    let score = Int((Double(correctAnswers) / Double(questions.count)) * 100)

                    // Collect all questions and all answers for full review
                    QuizReviewSheetView(
                        questions: questions,
                        userAnswers: userAnswers,
                        scorePercentage: score,
                        onDismiss: { showReviewSheet = false }
                    )
                }
            } else if hasStartedQuiz {
                // ✅ Quiz in Progress
                ScrollView {
                    VStack(spacing: 24) {
                        Text(questions[currentQuestionIndex].text)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        ForEach(0..<questions[currentQuestionIndex].answers.count, id: \.self) { index in
                            Button(action: {
                                selectedAnswer = index
                                print("Answer tapped: \(index)")
                            }) {
                                Text(questions[currentQuestionIndex].answers[index])
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        selectedAnswer == index ? Color.blue.opacity(0.7) : Color.gray.opacity(0.2)
                                    )
                                    .foregroundColor(.primary)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                        }

                        Button(action: {
                            print("Submit or Next tapped")

                            if let answer = selectedAnswer {
                                userAnswers.append(answer)
                                if answer == questions[currentQuestionIndex].correctAnswerIndex {
                                    correctAnswers += 1
                                }
                                selectedAnswer = nil

                                if currentQuestionIndex + 1 < questions.count {
                                    currentQuestionIndex += 1
                                } else {
                                    showResults = true
                                }
                            }
                        }) {
                            Text(currentQuestionIndex + 1 == questions.count ? "Submit" : "Next")
                                .font(.subheadline)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(selectedAnswer == nil ? Color.gray : Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .disabled(selectedAnswer == nil)
                        .padding(.horizontal)

                        Spacer(minLength: 40)
                    }
                    .padding(.top, 40)
                }
            } else {
                // ✅ Pre-Quiz Intro Screen
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            Spacer(minLength: 80)

                            VStack(spacing: 24) {
                                Text("🤔 Ready to see what you’ve learned?")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)

                                Text("Let’s test your memory with a few quick questions!")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)

                                Button(action: {
                                    print("Take the Quiz tapped ✅")
                                    withAnimation {
                                        hasStartedQuiz = true
                                    }
                                }) {
                                    Text("Take the Quiz")
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: 220)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()

                            Spacer(minLength: 80)
                        }
                    }
                }
            }
        }
    }
}
