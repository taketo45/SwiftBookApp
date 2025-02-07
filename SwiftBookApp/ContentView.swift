//
//  ContentView.swift
//  SwiftBookApp
//
//  Created by Taketoshi Ikegai on 2025/02/07.
//

import SwiftUI

struct ContentView: View {
    @State var books = [Book]()
    @State var isLoading: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                List(books, id: \.id) { book in
                    NavigationLink{
                        Text(book.volumeInfo.description ?? "No description")
                            .padding()
                    } label: {
                        Text(book.volumeInfo.title)
                    }
                }
                .navigationTitle("本の一覧") //　タイトル
                .navigationBarTitleDisplayMode(.inline) //小さく表示
                if isLoading {
                    ProgressView()
                }
            }
            .task {
                do {
                    isLoading = true
                    books = try await fetchBooks()
                    isLoading = false
                } catch {
                    isLoading = false
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchBooks() async throws -> [Book] {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=quilting"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw APIError.failedToFetch(statusCode: (response as?HTTPURLResponse)?.statusCode ?? -1)
        }
        
        do {
            let list = try JSONDecoder().decode(BookList.self, from: data)
            return list.items
        } catch {
            throw APIError.decodeError
        }
    }
    
}

#Preview {
    ContentView()
}
