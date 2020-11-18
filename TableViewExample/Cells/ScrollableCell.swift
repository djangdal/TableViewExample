//
//  ScrollableCell.swift
//  TableViewExample
//
//  Created by David Jangdal on 2020-11-18.
//

import UIKit

struct ScrollableCellDataSource: CellDataSource {
    static var cellIdentifier: String = "ScrollableCellIdentifier"
    
    let items: [CollectionViewCellDataSource]
}

class ScrollableCell: UITableViewCell {
    
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let collectionView: UICollectionView
    var items: [CollectionViewCellDataSource] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCellDataSource.cellIdentifier)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 5.0
        layout.itemSize = CGSize(width: 200, height: 200)

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.isUserInteractionEnabled = true
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }
}

extension ScrollableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataSource = items[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dataSource.cellIdentifier, for: indexPath) as? CollectionCell {
            cell.configure(dataSource)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ScrollableCell: UICollectionViewDelegate {
}

extension ScrollableCell: TableCell {
    func configure(_ dataSource: CellDataSource) {
        if let dataSource = dataSource as? ScrollableCellDataSource {
            items = dataSource.items
            collectionView.reloadData()
        }
    }
}
