//
//  CellDataSource.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import UIKit

protocol CellDataSource {
    var cellIdentifier: String { get }
    static var cellIdentifier: String { get }
}

extension CellDataSource {
    var cellIdentifier: String {
        Self.cellIdentifier
    }
}

protocol TableCell: UITableViewCell {
    func configure(_ dataSource: CellDataSource)
}

protocol CollectionCell: UICollectionViewCell {
    func configure(_ dataSource: CellDataSource)
}
