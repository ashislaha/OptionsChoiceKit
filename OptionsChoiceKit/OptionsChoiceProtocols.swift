//
//  OptionsChoiceProtocols.swift
//  OptionsChoiceKit
//
//  Created by Ashis Laha on 12/06/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit

// MARK:- Data Source
public struct OptionCellInformation {
	public let name: String
	public let backgroundColor: UIColor
	
	// struct default init is internal, only accessible to the library, not outside of the library
	public init(name: String, backgroundColor: UIColor) {
		self.name = name
		self.backgroundColor = backgroundColor
	}
}

public struct OptionSectionDataSource {
	public let sectionTitle: String
	public let cells: [OptionCellInformation]
	
	public init(sectionTitle: String, cells: [OptionCellInformation]) {
		self.sectionTitle = sectionTitle
		self.cells = cells
	}
}

public protocol OptionsChoiceViewControllerDataSource: class {
	var sectionsDataSource: [OptionSectionDataSource] {get set}
}


// MARK:- Delegate

public struct Option {
	public var cellInfo: OptionCellInformation
	public var sectionInfo: OptionSectionDataSource
	
	public init(cellInfo: OptionCellInformation, sectionInfo: OptionSectionDataSource) {
		self.cellInfo = cellInfo
		self.sectionInfo = sectionInfo
	}
}

public protocol OptionsChoiceViewControllerDelegate: class {
	func selectedOptions(viewController: OptionsChoiceViewController, options: [IndexPath: Option])
}
