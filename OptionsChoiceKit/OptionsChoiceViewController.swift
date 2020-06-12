//
//  OptionsChoiceViewController.swift
//  OptionsChoiceKit
//
//  Created by Ashis Laha on 12/06/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit

open class OptionsChoiceViewController: UIViewController {

	public weak var delegate: OptionsChoiceViewControllerDelegate?
	public weak var dataSource: OptionsChoiceViewControllerDataSource?
	
	
	private var collectionView: UICollectionView!
	
	open override func viewDidLoad() {
        super.viewDidLoad()

		initialiseCollectionView()
    }
	
	private func initialiseCollectionView() {
		let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
		view.addSubview(collectionView)
		collectionView.backgroundColor = .clear
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
		collectionView.register(OptionChoiceCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.register(OptionsChoiceCollectionSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
	}
}

extension OptionsChoiceViewController: UICollectionViewDataSource {
	
	public func numberOfSections(in collectionView: UICollectionView) -> Int {
		return dataSource?.sectionsDataSource.count ?? 0
	}
	public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource?.sectionsDataSource[section].cells.count ?? 0
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OptionChoiceCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		cell.cellInfo = dataSource?.sectionsDataSource[indexPath.section].cells[indexPath.row]
		return cell
	}
	
	
	// section header
	public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		if kind == UICollectionView.elementKindSectionHeader {
			if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? OptionsChoiceCollectionSectionHeader {
				
				header.sectionTitle = dataSource?.sectionsDataSource[indexPath.section].sectionTitle
				return header
			}
		}
		return UICollectionReusableView()
	}
}

extension OptionsChoiceViewController: UICollectionViewDelegate {
	
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// on selection -- create the dictionary
		// add apply and cancel button at navigation bar
	}
}

extension OptionsChoiceViewController: UICollectionViewDelegateFlowLayout {
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.bounds.width, height: 44)
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		// here we should return the correct CGSize based on cell's label content
		return CGSize(width: 100, height: 100)
	}
	
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 8
	}
	public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 8
	}
}
