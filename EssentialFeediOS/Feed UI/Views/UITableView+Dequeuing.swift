//
//  UITableView+Dequeuing.swift
//  EssentialFeediOS
//
//  Created by Gabriel Maldonado Almendra on 9/5/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
