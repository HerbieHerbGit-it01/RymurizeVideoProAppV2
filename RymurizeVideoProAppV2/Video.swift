struct Video: Identifiable {
    var id: String
    var title: String
    var description: String
    var url: String
    var thumbnailURL: String
    var category: String  // ✅ Add this line
}
