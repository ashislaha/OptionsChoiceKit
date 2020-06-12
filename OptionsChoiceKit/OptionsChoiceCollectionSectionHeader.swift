//
//  OptionsChoiceCollectionSectionHeader.swift
//  OptionsChoiceKit
//
//  Created by Ashis Laha on 12/06/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit

public class OptionsChoiceCollectionSectionHeader: UICollectionReusableView {
     
	public var sectionTitle: String? {
		didSet {
			title.text = sectionTitle
		}
	}
	
	private let title: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	private func setup() {
		addSubview(title)
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: topAnchor),
			title.leadingAnchor.constraint(equalTo: leadingAnchor),
			title.bottomAnchor.constraint(equalTo: bottomAnchor),
			title.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
