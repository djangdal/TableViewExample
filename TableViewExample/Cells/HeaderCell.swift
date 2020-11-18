//
//  HeaderCell.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import Foundation
import UIKit

struct HeaderDataSource: CellDataSource {
    static var cellIdentifier: String = "HeaderCellIdentifier"
    
    let imageColor: UIColor
    let titleText: String
}

class HeaderCell: UITableViewCell {
    
    let circleImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Arial-BoldMT", size: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleImageView)
        circleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        circleImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        circleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        circleImageView.layer.cornerRadius = 50
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HeaderCell: TableCell {
    func configure(_ dataSource: CellDataSource) {
        if let dataSource = dataSource as? HeaderDataSource {
            circleImageView.backgroundColor = dataSource.imageColor
            titleLabel.text = dataSource.titleText
        }
    }
}
