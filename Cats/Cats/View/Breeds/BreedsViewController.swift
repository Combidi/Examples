//
//  Created by Peter Combee on 22/07/2021.
//

import UIKit

protocol BreedsViewModelProtocol {
    var stateDidChange: (ModelState<[Breed]>) -> Void { get set }
    func loadBreeds()
}

class BreedsViewController: UIViewController {
    
    private var model: BreedsViewModelProtocol!
    private var didSelect: ((Breed) -> Void)!
    
    convenience init(
        model: BreedsViewModelProtocol,
        didSelect: @escaping (Breed) -> Void
    ) {
        self.init()
        self.model = model
        self.didSelect = didSelect
    }
        
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    private lazy var listViewController = ListSelectionViewController<Breed, BreedListCell>(
        tableView: tableView,
        didSelect: didSelect,
        configureCell: { cell, breed in
            cell.set(breed: breed)
        }
    )
    
    private var state: ModelState<[Breed]> = .idle {
        didSet {
            switch state {
            case .loading, .idle:
                print("loading")
            case .loaded(let breeds):
                listViewController.display(models: breeds)
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
        model.loadBreeds()
    }
    
}
