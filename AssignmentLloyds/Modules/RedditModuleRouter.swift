//
//  RedditRouter.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 11/01/23.
//

import Foundation
import UIKit

final class RedditModuleRouter {
    
    func goToDetailViewController(redditItem: RedditListEntity, view: UIViewController) {
        guard let module = RedditDetailModule().generateDetailViewController(redditItem: redditItem) else {return}
        view.navigationController?.pushViewController(module, animated: true)
    }
}
