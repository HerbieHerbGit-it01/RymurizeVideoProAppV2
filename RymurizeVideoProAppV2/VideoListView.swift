// 🔁 TODO: Add support for re-shuffling quiz on retries or 'Try Again' button

let brueQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "BRUE stands for Brief Resolved Unexplained Event.",
        answers: ["True", "False"],
        correctAnswerIndex: 0,
        explanation: "True. BRUE is an acronym for Brief Resolved Unexplained Event, a diagnosis used when an infant has a sudden, short-lived episode that is unexplained after evaluation."
    ),
    QuizQuestion(
        text: "Which of the following is NOT a low-risk BRUE criterion?",
        answers: [
            "Age over 60 days",
            "No CPR required by trained medical provider",
            "History of repeated BRUE episodes",
            "Duration less than 1 minute"
        ],
        correctAnswerIndex: 2,
        explanation: "A history of repeated BRUE episodes indicates a higher risk and disqualifies the infant from being categorized as low-risk."
    ),
    QuizQuestion(
        text: "Which age group is considered when applying BRUE guidelines?",
        answers: ["Under 12 months", "Under 6 months", "Under 24 months", "Under 3 months"],
        correctAnswerIndex: 1,
        explanation: "BRUE criteria apply specifically to infants younger than 6 months."
    )
]

let emsOpsQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "Which of the following best describes implied consent?",
        answers: [
            "When a patient signs a consent form",
            "When a patient refuses care",
            "When a person is unconscious and unable to consent, but care is given",
            "When a guardian gives permission for a minor"
        ],
        correctAnswerIndex: 2,
        explanation: "Implied consent applies when a patient is unresponsive or altered, and it's assumed they would want emergency care."
    ),
    QuizQuestion(
        text: "Which federal law protects patient privacy and regulates sharing of medical information?",
        answers: [
            "EMTALA",
            "DNR",
            "OSHA",
            "HIPAA"
        ],
        correctAnswerIndex: 3,
        explanation: "HIPAA ensures confidentiality of health information and limits what can be shared without patient consent."
    ),
    QuizQuestion(
        text: "What could legally be considered kidnapping by an EMT?",
        answers: [
            "Transporting a patient after they give verbal consent",
            "Refusing to transport a stable patient",
            "Transporting a competent adult against their will",
            "Providing care to a minor with guardian permission"
        ],
        correctAnswerIndex: 2,
        explanation: "Forcibly transporting a competent adult who refuses care can be considered kidnapping under medical law."
    )
]
let marchQuizQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "What does the 'M' in MARCH stand for?",
        answers: ["Massive Hemorrhage", "Mental Status", "Muscle Tone", "Medical History"],
        correctAnswerIndex: 0,
        explanation: "'M' stands for Massive Hemorrhage — it's the first and most urgent priority in MARCH."
    ),
    QuizQuestion(
        text: "Which intervention comes first in the MARCH algorithm?",
        answers: ["Airway", "Respiration", "Massive Hemorrhage", "Circulation"],
        correctAnswerIndex: 2,
        explanation: "Massive Hemorrhage always comes first — stop the bleed before anything else."
    ),
    QuizQuestion(
        text: "What is the goal of the 'R' step in MARCH?",
        answers: ["Remove hazards", "Restore breathing", "Assess responsiveness", "Reposition patient"],
        correctAnswerIndex: 1,
        explanation: "'R' stands for Respiration — restore breathing using chest seals, decompression, etc."
    )
]
import SwiftUI
import AVKit

// MARK: – Video-specific Quiz Data
let gcsQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "A patient opens eyes to speech, speaks incoherently, and withdraws from pain. What is their total GCS score?",
        answers: ["8", "9", "7", "10"],
        correctAnswerIndex: 1,
        explanation: "E3 (eyes to speech) + V2 (incoherent speech) + M4 (withdraws from pain) = 9 on the GCS scale."
    ),
    QuizQuestion(
        text: "Best verbal response: oriented, confused, inappropriate words, incomprehensible sounds, or none?",
        answers: ["Oriented", "Confused", "Inappropriate words", "Incomprehensible sounds", "None"],
        correctAnswerIndex: 0,
        explanation: "Being oriented indicates the best verbal response (score: 5)."
    ),
    QuizQuestion(
        text: "Best motor response: obeys commands, localizes pain, withdraws, flexion, extension, or none?",
        answers: ["Obeys commands", "Localizes pain", "Withdraws", "Flexion", "Extension", "None"],
        correctAnswerIndex: 0,
        explanation: "Obeying commands is the highest level of motor response (score: 6)."
    )
]

let sgarbossaQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "Which of the following is a Sgarbossa criterion used to identify acute MI in the presence of LBBB or a paced rhythm?",
        answers: [
            "Concordant ST elevation ≥ 1 mm in a lead with a positive QRS",
            "Any ST elevation > 2 mm",
            "ST elevation in aVR",
            "Tall R wave in V1"
        ],
        correctAnswerIndex: 0,
        explanation: "Concordant ST elevation ≥ 1 mm in a lead with a positive QRS complex is one of the classic Sgarbossa criteria. It indicates injury currents in the same direction as depolarization — a sign of acute MI even in the presence of LBBB or a paced rhythm."
    ),
    QuizQuestion(
        text: "Which of the following best describes **excessive discordant ST elevation** in the Sgarbossa criteria?",
        answers: [
            "ST elevation ≥ 5 mm or > 25% of the preceding S-wave in leads with a negative QRS complex",
            "Any ST elevation ≥ 2 mm in any lead",
            "ST depression ≥ 1 mm in inferior leads",
            "QRS duration > 160 ms"
        ],
        correctAnswerIndex: 0,
        explanation: "Excessive discordant ST elevation is defined as ≥ 5 mm or > 25% of the depth of the preceding S-wave in leads with a negative QRS complex. This helps identify MI in the presence of LBBB or a paced rhythm."
    ),
    QuizQuestion(
        text: "What is the clinical use of Sgarbossa criteria?",
        answers: [
            "To diagnose STEMI in patients with left bundle branch block",
            "To rule out atrial fibrillation",
            "To confirm hyperkalemia",
            "To measure QT interval"
        ],
        correctAnswerIndex: 0,
        explanation: "Sgarbossa criteria are used to identify STEMI in the presence of left bundle branch block or a ventricular-paced rhythm."
    )
]

let apgarQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "In the APGAR score, what does the first 'A' stand for?",
        answers: ["Appearance", "Alertness", "Arms", "Airway"],
        correctAnswerIndex: 0,
        explanation: "The first 'A' in APGAR stands for 'Appearance', referring to skin color as an indicator of oxygenation."
    ),
    QuizQuestion(
        text: "A newborn with a heart rate of 110 bpm receives what APGAR score for 'Pulse'?",
        answers: ["0", "1", "2", "3"],
        correctAnswerIndex: 2,
        explanation: "A heart rate over 100 bpm receives a score of 2 in the APGAR 'Pulse' category."
    ),
    QuizQuestion(
        text: "Which APGAR category evaluates reflex irritability?",
        answers: ["Activity", "Grimace", "Appearance", "Respiration"],
        correctAnswerIndex: 1,
        explanation: "Grimace refers to reflex irritability — how the baby responds to stimulation."
    )
]

let apgarQuizQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "In the APGAR score, what does the first 'A' stand for?",
        answers: ["Appearance", "Alertness", "Arms", "Airway"],
        correctAnswerIndex: 0,
        explanation: "The first 'A' in APGAR stands for 'Appearance', referring to skin color as an indicator of oxygenation."
    ),
    QuizQuestion(
        text: "Which APGAR category evaluates reflex irritability?",
        answers: ["Activity", "Grimace", "Appearance", "Respiration"],
        correctAnswerIndex: 1,
        explanation: "Grimace refers to reflex irritability — how the baby responds to stimulation."
    ),
    QuizQuestion(
        text: "A newborn has a heart rate of 110 bpm, active movement, cries vigorously, grimaces when stimulated, and has a pink body with blue extremities. What is their total APGAR score?",
        answers: ["10", "6", "8", "4"],
        correctAnswerIndex: 2,
        explanation: "Pulse = 2, Activity = 2, Respiration = 2, Grimace = 1, Appearance = 1 → Total APGAR score = 8."
    )
]

let brueQuizQuestions: [QuizQuestion] = [
    QuizQuestion(
        text: "BRUE stands for Brief Resolved Unexplained Event.",
        answers: ["True", "False"],
        correctAnswerIndex: 0,
        explanation: "True. BRUE is an acronym for Brief Resolved Unexplained Event, a diagnosis used when an infant has a sudden, short-lived episode that is unexplained after evaluation."
    ),
    QuizQuestion(
        text: "Which of the following is NOT a low-risk BRUE criterion?",
        answers: [
            "Age over 60 days",
            "No CPR required by trained medical provider",
            "History of repeated BRUE episodes",
            "Duration less than 1 minute"
        ],
        correctAnswerIndex: 2,
        explanation: "A history of repeated BRUE episodes indicates a higher risk and disqualifies the infant from being categorized as low-risk."
    ),
    QuizQuestion(
        text: "Which age group is considered when applying BRUE guidelines?",
        answers: ["Under 12 months", "Under 6 months", "Under 24 months", "Under 3 months"],
        correctAnswerIndex: 1,
        explanation: "BRUE criteria apply specifically to infants younger than 6 months."
    )
]


func quizForVideoURL(_ url: URL) -> [QuizQuestion] {
    if url.absoluteString.contains("apgar") {
        return apgarQuizQuestions
    } else if url.absoluteString.contains("brue") {
        return brueQuizQuestions
    } else if url.absoluteString.contains("gcs_score") {
        return gcsQuestions
    } else if url.absoluteString.contains("sgarbossa") {
        return sgarbossaQuestions
    } else if url.absoluteString.contains("ems_ops") {
        return emsOpsQuestions
    }else if url.absoluteString.lowercased().contains("march") {
        return marchQuizQuestions
    }
    return []
}

struct VideoDescriptionItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
struct VideoListView: View {
    @StateObject private var viewModel = VideoViewModel()
    @State private var selectedVideoURL: URL? = nil
    @State private var selectedVideoDescription: VideoDescriptionItem? = nil
    @State private var currentPlayerVideo: URL? = nil
    @State private var showQuiz: Bool = false
    @State private var showMenu = false

    var body: some View {
        ZStack(alignment: .top) {
            // 🔹 Background
            Image("BackgroundGradient")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // 🔹 Hamburger menu button (now at the top right)
                HStack {
                    Spacer()
                    Button(action: {
                        showMenu = true
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.clear) // Explicitly clear any background
                    }
                    .buttonStyle(PlainButtonStyle()) // Prevent automatic background styling
                }
                .padding(.top, 50)
                .padding(.trailing, 75) // moved left by increasing right padding
                .zIndex(3)

                // 🔹 Fixed RYMURIZE header
                Text("RYMURIZE")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .padding(.bottom, 10)
                    .background(Color.clear)
                    .zIndex(2)

                // 🔹 Scrollable video content
                ScrollView {
                    VStack(spacing: 24) {
                        Spacer().frame(height: 60) // Top clamp

                        ForEach(viewModel.categorizedVideos.keys.sorted(), id: \.self) { category in
                            CategorySectionView(
                                category: category,
                                videos: viewModel.categorizedVideos[category] ?? [],
                                onVideoSelected: { url in
                                    selectedVideoURL = url
                                },
                                onDescriptionSelected: { title, description in
                                    selectedVideoDescription = VideoDescriptionItem(title: title, description: description)
                                }
                            )
                        }

                        Spacer().frame(height: 80) // Bottom clamp
                    }
                    .background(Color.clear)
                }
                .clipped()
            }

            // 🔹 Video modal
            .sheet(item: $selectedVideoURL) { videoURL in
                let selectedQuiz = quizForVideoURL(videoURL).shuffled()
                VideoPlayerContainer(
                    videoURL: videoURL,
                    showQuiz: $showQuiz,
                    onQuizComplete: {
                        selectedVideoURL = nil
                    },
                    quizQuestions: selectedQuiz
                )
            }
            // 🔹 Description modal
            .sheet(item: $selectedVideoDescription) { item in
                VideoDescriptionModal(title: item.title, description: item.description)
            }
            .sheet(isPresented: $showMenu) {
                HamburgerMenuView()
            }
        }
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct HamburgerMenuView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Info")) {
                    NavigationLink(destination: AboutView()) {
                        HStack(spacing: 16) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.blue)
                            Text("About Rymurize")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 4)
                    }
                    NavigationLink(destination: HowItWorksView()) {
                        HStack(spacing: 16) {
                            Image(systemName: "lightbulb")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.blue)
                            Text("How It Works")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 4)
                    }
                }

                Section(header: Text("Support")) {
                    Link(destination: URL(string: "mailto:medicalmusicproducer@gmail.com")!) {
                        HStack(spacing: 16) {
                            Image(systemName: "envelope")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.blue)
                            Text("Send Feedback")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 4)
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        HStack(spacing: 16) {
                            Image(systemName: "lock.shield")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.blue)
                            Text("Privacy Policy")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Rymurize")
                    .font(.largeTitle.bold())
                Text("🎶 A New Way to Learn Stuff.")
                    .font(.title3)
                    .padding(.bottom)
                Text("This app was built from scratch by a dedicated Medical Music Producer on a mission to make EMT and paramedic education unforgettable using rhythm, music, and engaging visuals.")
            }
            .padding()
        }
        .navigationTitle("About")
    }
}

struct HowItWorksView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("1. Watch the music-powered medical video.\n2. Reach the end to unlock your quiz.\n3. Take the quiz to reinforce what you learned.\n\nSimple, powerful, and built to help stuff stick.")
            }
            .padding()
        }
        .navigationTitle("How It Works")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Rymurize does not collect personal data. Videos are streamed via Firebase, and no identifying information is stored or shared. Your privacy matters.")
            }
            .padding()
        }
        .navigationTitle("Privacy Policy")
    }
}

struct VideoPlayerContainer: View {
    let videoURL: URL
    @Environment(\.dismiss) var dismiss
    @State private var player: AVPlayer?
    @Binding var showQuiz: Bool
    var onQuizComplete: (() -> Void)? = nil
    let quizQuestions: [QuizQuestion]

    // Store observer to remove it later (prevent leaks)
    @State private var endObserver: Any?
    @State private var showIntroBanner = true

    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showIntroBanner = false
                            }
                        }
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .sheet(isPresented: $showQuiz) {
                        if !quizQuestions.isEmpty {
                            QuizModalView(
                                questions: quizQuestions,
                                onQuizComplete: {
                                    // Dismiss the video sheet and return to categories
                                    onQuizComplete?()
                                }
                            )
                        } else {
                            EmptyView()
                        }
                    }
                    .ignoresSafeArea()
            }
            if showIntroBanner {
                VStack {
                    Spacer()
                    HStack {
                        Text("🎯 Watch to the end to unlock your quiz!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 0, y: 1)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black.opacity(0.6))
                            )
                            .transition(.opacity.combined(with: .move(edge: .top)))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.top, 60)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .transition(.opacity)
            }
        }
        .onAppear {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                let avPlayer = AVPlayer(url: videoURL)
                player = avPlayer

                // REMOVE existing observer if any
                if let observer = endObserver {
                    NotificationCenter.default.removeObserver(observer)
                }

                // ADD the end-of-play observer
                endObserver = NotificationCenter.default.addObserver(
                    forName: .AVPlayerItemDidPlayToEndTime,
                    object: avPlayer.currentItem,
                    queue: .main
                ) { _ in
                    if !quizQuestions.isEmpty {
                        print("✅ Video finished — showQuiz triggered")
                        showQuiz = true
                    } else {
                        print("ℹ️ Video finished — no quiz available for this video")
                        onQuizComplete?()
                    }
                }
            } catch {
                print("Failed to set audio session: \(error)")
            }
        }
        .onDisappear {
            // REMOVE observer on exit
            if let observer = endObserver {
                NotificationCenter.default.removeObserver(observer)
                endObserver = nil
            }
        }
    }
}
extension URL: Identifiable {
    public var id: String { absoluteString }
}

struct CategorySectionView: View {
    let category: String
    let videos: [Video]
    let onVideoSelected: (URL) -> Void
    let onDescriptionSelected: (String, String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(category)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.leading, 77)
            .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(videos) { video in
                        VideoTileView(video: video) {
                            onVideoSelected(URL(string: video.url)!)
                        } onDescriptionTap: {
                            onDescriptionSelected(video.title, video.description)
                        }
                        .frame(width: 210)
                    }
                }
                .padding(.leading, 62)
            }
        }
    }
}
