import SwiftUI
import FirebaseFirestore

class VideoViewModel: ObservableObject {
    @Published var categorizedVideos: [String: [Video]] = [:]

    init() {
        fetchVideos()
    }

    func fetchVideos() {
        let db = Firestore.firestore()
        db.collection("videos").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("Error fetching videos: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let videos: [Video] = documents.compactMap { doc in
                let data = doc.data()
                return Video(
                    id: doc.documentID,
                    title: data["title"] as? String ?? "",
                    description: data["description"] as? String ?? "",
                    url: data["url"] as? String ?? "",
                    thumbnailURL: data["thumbnail_url"] as? String ?? "",  // ✅ MATCHES MODEL
                    category: data["category"] as? String ?? ""
                )
            }

            DispatchQueue.main.async {
                self.categorizedVideos = Dictionary(grouping: videos, by: { $0.category })
                print("📦 categorizedVideos count:", self.categorizedVideos.count)
               
            }
        }
    }
}
