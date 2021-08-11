//
//  Created by Peter Combee on 26/07/2021.
//

import UIKit

class ListSelectionViewController<Model, Cell: UITableViewCell>: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var models: [Model] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView: UITableView!
    private var didSelect: ((Model) -> Void)!
    private var configureCell: ((Cell, Model) -> Void)!
    
    convenience init(
        tableView: UITableView = UITableView(),
        didSelect: @escaping (Model) -> Void,
        configureCell: @escaping (Cell, Model) -> Void
    ) {
        self.init()
        self.tableView = tableView
        self.didSelect = didSelect
        self.configureCell = configureCell
    }
    
    func display(models: [Model]) {
        self.models = models
    }
    
    override func loadView() {
        view = tableView
        tableView.register(Cell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(models[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueReusableCell()
        configureCell(cell, models[indexPath.row])
        return cell
    }
        
}
