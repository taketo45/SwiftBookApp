struct BookList: Decodable {
    let items: [Book]
}

struct Book: Decodable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let description: String?
}
