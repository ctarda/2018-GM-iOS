
import Foundation

struct NetworkRequest {

    func get(url: URL, callback: @escaping ([BookViewModel]?, Error?) -> Void) {

        //Context of get function
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else {
//                callback(nil, error)
                return
            }

            do {
                let googleBooksRoot = try JSONDecoder().decode(GoogleBooksRoot.self, from: data)

                let books = self.createBooks(from: googleBooksRoot)

                callback(books, nil)

            } catch {
                callback(nil, error)
            }
        }

        dataTask.resume()
    }

    func createBooks(from googleBookRoot: GoogleBooksRoot) -> [BookViewModel] {

        return googleBookRoot.items.map { (googleBook) -> BookViewModel in
            return BookViewModel(
                title: googleBook.volumeInfo.title,
                subtitle: googleBook.volumeInfo.subtitle ?? "",
                author: googleBook.volumeInfo.authors?.first ?? "",
                extendedDescription: googleBook.volumeInfo.description ?? "",
                thumbnail: googleBook.volumeInfo.imageLinks?.smallThumbnail ?? ""
            )
        }
    }
}
