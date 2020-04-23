import UIKit
import AlamofireImage

extension UIImageView {
    
    func setImage(urlString: String?, placeholder: UIImage?) {
        if let urlString = urlString, let url = URL(string: urlString) {
            self.af.setImage(withURL: url, placeholderImage: placeholder)
        }
        else {
            self.image = placeholder
        }
    }
    
}
