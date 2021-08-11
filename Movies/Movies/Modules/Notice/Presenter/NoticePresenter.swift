//
//  Created by Peter Combee on 09/08/2021.
//

import UIKit

struct NoticePresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(using navigationController: UINavigationController) {
        router?.pushToMovieScreen(using: navigationController)
    }
    
}

extension NoticePresenter: InteractorToPresenterProtocol {
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    func noticeFetchSuccess(_ notice: [Notice]) {
        view?.show(notice: notice)
    }
    
}
