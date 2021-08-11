//
//  Created by Peter Combee on 09/08/2021.
//

import UIKit

protocol ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }

    func startFetchingNotice()
    func showMovieController(using navigationController: UINavigationController)
    
}

protocol PresenterToViewProtocol {
    func show(notice: [Notice])
    func showError()
}

protocol PresenterToRouterProtocol {
    static func createModule() -> UIViewController
    func pushToMovieScreen(using navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchNotice()
}

protocol InteractorToPresenterProtocol {
    func noticeFetchFailed()
    func noticeFetchSuccess(_ notice: [Notice])
}
