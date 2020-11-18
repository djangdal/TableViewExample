//
//  CollectionViewItem.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import Foundation
import UIKit

protocol CollectionViewCellDelegate: class {
    func collectionViewCell(_ cell: CollectionViewCell, didTap dataSource: CollectionViewCellDataSource)
}

struct CollectionViewCellDataSource: CellDataSource {
    static var cellIdentifier: String = "CollectionViewCellIdentifier"
    
    let color: UIColor
    let description: String
    weak var delegate: CollectionViewCellDelegate?
}

class CollectionViewCell: UICollectionViewCell {
    
    private let button = UIButton()
    private let descriptionLabel = UILabel()
    
    private var dataSource: CollectionViewCellDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        descriptionLabel.textAlignment = .center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        button.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.layer.cornerRadius = 35
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func didTapButton() {
        dataSource?.delegate?.collectionViewCell(self, didTap: dataSource!)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CollectionViewCell: CollectionCell {
    func configure(_ dataSource: CellDataSource) {
        if let dataSource = dataSource as? CollectionViewCellDataSource {
            self.dataSource = dataSource
            button.backgroundColor = dataSource.color
            descriptionLabel.text = dataSource.description
        }
    }
}
