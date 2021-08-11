//
//  Created by Peter Combee on 09/08/2021.
//

import UIKit

class NoticeViewController: UIViewController, PresenterToViewProtocol {
    
    private let tableView = UITableView()

    private var notice: [Notice] = []
    
    func show(notice: [Notice]) {
        
    }
    
    func showError() {
        
    }
    
    
    
}

extension NoticeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NoticeCell
        cell.update(from: notice[indexPath.row])
        return cell
    }
    
}

extension NoticeCell {
    func update(from notice: Notice) {
        idLabel.text = notice.id
        titleLabel.text = notice.title
        briefLabel.text = notice.brief
        sourceLabel.text = notice.source
    }
}
