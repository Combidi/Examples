//
//  Created by Peter Combee on 26/07/2021.
//

import UIKit
import Combine

class ImageGaleryViewController: UIViewController, UICollectionViewDataSource {
    
    private var images: [Image] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func display(images: [Image]) {
        self.images = images
    }
    
    override func loadView() {
        view = collectionView
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
        
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemPink
        return view
    }()
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let image = images[indexPath.row]
        guard let imageView = cell.contentView.subviews.compactMap({ $0 as? UIImageView }).first else {
            let imageView = UIImageView()
            cell.contentView.addViewFillingSubview(imageView)
            imageView.presentImageFrom(urlString: image.url)
            return cell
        }
        imageView.presentImageFrom(urlString: image.url)
        return cell
    }
    
}
