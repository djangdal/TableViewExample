//
//  FooterCell.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import UIKit

struct FooterDataSource: CellDataSource {
    static var cellIdentifier: String = "FooterCellIdentifier"
    
    let imageColor: UIColor
    let titleText: String
}

class FooterCell: UITableViewCell {
    
    let squareImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        squareImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(squareImageView)
        squareImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        squareImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        squareImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: squareImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FooterCell: TableCell {
    func configure(_ dataSource: CellDataSource) {
        if let dataSource = dataSource as? FooterDataSource {
            squareImageView.backgroundColor = dataSource.imageColor
            titleLabel.text = dataSource.titleText
        }
    }
}
