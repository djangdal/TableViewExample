//
//  MainPresenter.swift
//  voi-app
//
//  Created by David Jangdal on 2020-11-18.
//  Copyright © 2019 Voi Technology. All rights reserved.
//

import Voiper

final class MainPresenter: Presenter {
    typealias ViewDelegateType = MainViewControllerProtocol
    typealias InteractorType = MainInteractorProtocol
    typealias RouterType = MainRouterProtocol
    typealias Configuration = Void
    
    private var rows: [CellDataSource] = []
    private var titleText: String = "Some initial text"
    
    required init(configuration: Configuration) {
        super.init()
        createDataSource()
    }
    
    func createDataSource() {
        rows.removeAll()
        rows.append(HeaderDataSource(imageColor: .red, titleText: titleText))
        rows.append(TitleDataSource(titleText: "A scrollable section"))
        rows.append(ScrollableCellDataSource(items: [CollectionViewCellDataSource(color: .darkGray, description: "Item one", delegate: self),
                                                     CollectionViewCellDataSource(color: .gray, description: "Item in middle", delegate: self),
                                                     CollectionViewCellDataSource(color: .lightGray, description: "Last item", delegate: self)]))
        rows.append(TitleDataSource(titleText: "Another scrollable section"))
        rows.append(ScrollableCellDataSource(items: [CollectionViewCellDataSource(color: .systemPink, description: "Item pink", delegate: self),
                                                     CollectionViewCellDataSource(color: .purple, description: "Item purple", delegate: self),
                                                     CollectionViewCellDataSource(color: .orange, description: "Last orange", delegate: self)]))
        rows.append(TitleDataSource(titleText: "Maybe more sections"))
        rows.append(FooterDataSource(imageColor: .green, titleText: "This is the text for the footer"))
    }
}

extension MainPresenter: MainPresenterProtocol {
    var numberOfRows: Int {
        rows.count
    }
    func dataSource(for row: Int) -> CellDataSource {
        rows[row]
    }
}

extension MainPresenter: CollectionViewCellDelegate {
    func collectionViewCell(_ cell: CollectionViewCell, didTap dataSource: CollectionViewCellDataSource) {
        print("Did tap cell-button with text \(dataSource.description)")
        titleText = dataSource.description
        createDataSource()
        viewDelegate.reloadUI()
    }
}
