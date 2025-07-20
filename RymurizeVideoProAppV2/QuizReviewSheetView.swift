import SwiftUI

struct QuizReviewSheetView: View {
    let questions: [QuizQuestion]
    let userAnswers: [Int]   // parallel array, one selected index per question
    let scorePercentage: Int
    let onDismiss: () -> Void

    var calculatedScore: Int {
        guard !questions.isEmpty, questions.count == userAnswers.count else {
            print("🧨 Invalid input. questions.count = \(questions.count), userAnswers.count = \(userAnswers.count)")
            return 0
        }

        var correctCount = 0
        for (index, question) in questions.enumerated() {
            let correctIndex = question.correctAnswerIndex
            if index < userAnswers.count && correctIndex == userAnswers[index] {
                correctCount += 1
            }
        }

        let score = Double(correctCount) / Double(questions.count) * 100
        print("🧮 Final Score: \(score)%")
        return Int(score.rounded())
    }

    // ✅ DEBUG DIAGNOSTICS
    init(questions: [QuizQuestion], userAnswers: [Int], scorePercentage: Int, onDismiss: @escaping () -> Void) {
        self.questions = questions
        self.userAnswers = userAnswers
        self.scorePercentage = scorePercentage
        self.onDismiss = onDismiss

        print("🧠 QuizReviewSheetView INIT")
        print("➡️ Questions received: \(questions.count)")
        print("➡️ User answers received: \(userAnswers)")
        for (i, q) in questions.enumerated() {
            print("Q\(i + 1): \(q.text)")
            print("  Correct Answer Index: \(q.correctAnswerIndex)")
            if i < userAnswers.count {
                print("  User Answer: \(userAnswers[i])")
            }
        }
    }

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            VStack {
                EncouragementMessageView(score: calculatedScore, showingAnswers: calculatedScore <= 75)

                Text("Your Score: \(calculatedScore)%")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom)

                if calculatedScore <= 75 {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            ForEach(Array(questions.enumerated()), id: \.offset) { (index, question) in
                                if question.correctAnswerIndex != userAnswers[index] {
                                    QuizReviewItem(
                                        index: index,
                                        question: question,
                                        userAnswer: userAnswers[index]
                                    )
                                    .transition(.scale)
                                    .animation(.easeInOut(duration: 0.4), value: UUID())
                                }
                            }
                        }
                        .padding()
                    }

                    GeometryReader { geometry in
                        HStack(spacing: 30) {
                            Button(action: {
                                onDismiss()
                            }) {
                                Text("Retry")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: (geometry.size.width - 90) / 2, height: 44)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                onDismiss()
                            }) {
                                Text("Close")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: (geometry.size.width - 90) / 2, height: 44)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(width: geometry.size.width)
                    }
                    .frame(height: 60)
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct QuizReviewItem: View {
    let index: Int
    let question: QuizQuestion
    let userAnswer: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q\(index + 1): \(question.text)")
                .font(.headline)

            ForEach(question.answers.indices, id: \.self) { i in
                let answer = question.answers[i]
                let correct = i == question.correctAnswerIndex
                let selected = i == userAnswer

                HStack {
                    Image(systemName: correct ? "checkmark.circle" : (selected ? "xmark.circle" : "circle"))
                        .foregroundColor(correct ? .green : (selected ? .red : .gray))
                        .scaleEffect(selected && correct ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 0.3), value: selected && correct)
                    Text(answer)
                        .foregroundColor(correct ? .green : (selected ? .red : .primary))
                }
            }

            if let explanation = question.explanation {
                Text("🧠 \(explanation)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct EncouragementMessageView: View {
    let score: Int
    let showingAnswers: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            if score == 100 {
                Text("🎉 You're on a roll!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                Text("Fantastic work — you nailed every question. 🚀")
                    .font(.title3)
                    .foregroundColor(.secondary)
            } else if score >= 80 {
                Text("👏 Great effort!")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("You're almost there. Keep practicing!")
                    .font(.body)
            } else {
                Text("💪 Keep pushing!")
                    .font(.title2)
                    .foregroundColor(.orange)

                Group {
                    if showingAnswers {
                        Text("Review the answers below and try again.")
                    } else {
                        Text("Give it another shot when you're ready.")
                    }
                }
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.top)
    }
}
