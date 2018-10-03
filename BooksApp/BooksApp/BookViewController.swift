
import UIKit
import Kingfisher

struct BookViewModel: CustomStringConvertible {
    let title: String
    let subtitle: String
    let author: String
    let extendedDescription: String
    let thumbnail: String

    var description: String {
        return "I am a book, my title is \(title)"
    }
}

final class BookViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!

    var book = BookViewModel(title: "Moby Dick", subtitle: "A book about a whale", author: "Herman Melville", extendedDescription: "This is a book about a man tryin gto hunt a whale.", thumbnail: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        assignTitle()
        assignSubtitle()
        assignAuthor()
        assignDescription()
        assignThumbnail()

        print(book)
    }

    private func assignThumbnail() {
        let url = book.thumbnail
        guard let thumbnailURL = URL(string: url) else {
            return
        }

        let resource = ImageResource(downloadURL: thumbnailURL)
        coverImageView.kf.setImage(with: resource)
    }

    private func assignTitle() {
        titleLabel.text = book.title
    }

    private func assignSubtitle() {
        subtitleLabel.text = book.subtitle
    }

    private func assignAuthor() {
        authorLabel.text = book.author
    }

    private func assignDescription() {
        descriptionTextView.text = book.extendedDescription
    }
}
