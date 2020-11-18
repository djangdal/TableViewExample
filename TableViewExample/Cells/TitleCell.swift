//
//  TitleCell.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import UIKit

struct TitleDataSource: CellDataSource {
    static var cellIdentifier: String = "TitleCellIdentifier"
    let titleText: String
}

class TitleCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = UIFont(name: "Arial-BoldMT", size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TitleCell: TableCell {
    func configure(_ dataSource: CellDataSource) {
        if let dataSource = dataSource as? TitleDataSource {
            titleLabel.text = dataSource.titleText
        }
    }
}
