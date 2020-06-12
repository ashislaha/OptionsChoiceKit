//
//  ConsumerOneViewController.swift
//  OptionsChoice
//
//  Created by Ashis Laha on 12/06/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit
import OptionsChoiceKit

class ConsumerOneViewController: UIViewController, OptionsChoiceViewControllerDataSource {

	var sectionsDataSource: [OptionSectionInformation] = [
		
		OptionSectionInformation(sectionTitle: "consumer1-section-1", cells: [
			OptionCellInformation(name: "consumer-1-1", backgroundColor: .red),
			OptionCellInformation(name: "consumer-1-2", backgroundColor: .green),
			OptionCellInformation(name: "consumer-1-3", backgroundColor: .yellow)
		]),
		OptionSectionInformation(sectionTitle: "consumer1-section-2", cells: [
			OptionCellInformation(name: "consumer-2-1", backgroundColor: .purple),
			OptionCellInformation(name: "consumer-2-2", backgroundColor: .red),
			OptionCellInformation(name: "consumer-2-3", backgroundColor: .orange),
			OptionCellInformation(name: "consumer-2-4", backgroundColor: .gray)
		])
	]

    override func viewDidLoad() {
        super.viewDidLoad()
	
		createOptionChoiceViewController()
    }
	
	private func createOptionChoiceViewController() {
		
		let optionsChoiceVC = OptionsChoiceViewController()
		optionsChoiceVC.delegate = self
		optionsChoiceVC.dataSource = self
		
		addChild(optionsChoiceVC)
		view.addSubview(optionsChoiceVC.view)
		optionsChoiceVC.didMove(toParent: self)
	}
	
	
}

extension ConsumerOneViewController: OptionsChoiceViewControllerDelegate {
	
	func selectedOptions(viewController: OptionsChoiceViewController, options: [IndexPath : Option]) {
		print(options)
	}
}
