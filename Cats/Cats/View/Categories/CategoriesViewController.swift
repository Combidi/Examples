//
//  Created by Peter Combee on 26/07/2021.
//

import UIKit

protocol CategoriesViewModelProtocol {
    var stateDidChange: (ModelState<[Category]>) -> Void { get set }
    func loadCategories()
}

class CategoriesViewController: UIViewController {
    
    private var model: CategoriesViewModelProtocol!
    private var didSelect: ((Category) -> Void)!
    
    convenience init(
        model: CategoriesViewModelProtocol,
        didSelect: @escaping (Category) -> Void
    ) {
        self.init()
        self.model = model
        self.didSelect = didSelect
    }
        
    private lazy var listViewController = ListSelectionViewController<Category, UITableViewCell>(
        didSelect: didSelect,
        configureCell: { cell, category in
            cell.textLabel?.text = category.name
        }
    )

    private var state: ModelState<[Category]> = .idle {
        didSet {
            switch state {
            case .loading, .idle:
                print("loading")
            case .loaded(let categories):
                listViewController.display(models: categories)
            case .message(let message):
                present(message: message)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.stateDidChange = { [unowned self] in self.state = $0 }
        installHeader()
        installList()
        headerView.title = title
    }
    
    private func installHeader() {
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func installList() {
        listViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(listViewController)
        view.addSubview(listViewController.view)
        listViewController.view.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        listViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listViewController.didMove(toParent: self)
    }

    private let headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        model.loadCategories()
    }

}
