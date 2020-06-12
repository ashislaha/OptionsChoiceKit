//
//  ViewController.swift
//  OptionsChoice
//
//  Created by Ashis Laha on 12/06/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let consumer1 = ConsumerOneViewController()
	let consumer2 = ConsumerTwoViewController()
	let consumer3 = ConsumerThreeViewController()
	
	var currentViewController: UIViewController? {
		willSet {
			print(newValue ?? "upcomingVC")
			if let oldViewController = currentViewController { // remove the old VC
				removeChildViewController(oldViewController)
			}
		}
	}
	
	
	@IBAction func consumersTapped(_ sender: UIBarButtonItem) {
		
		let actionSheet = UIAlertController(title: "choose Consumers", message: nil, preferredStyle: .actionSheet)
		
		let consumer1 = UIAlertAction(title: "Consumer1", style: .default) { (action) in
			self.initialiseConsumer1()
		}
		let consumer2 = UIAlertAction(title: "Consumer2", style: .default) { (action) in
			self.initialiseConsumer2()
		}
		let consumer3 = UIAlertAction(title: "Consumer3", style: .default) { (action) in
			self.initialiseConsumer3()
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		[consumer1, consumer2, consumer3, cancelAction].forEach { actionSheet.addAction($0) }
		present(actionSheet, animated: true, completion: nil)
	}
	
	private func initialiseConsumer1() {
		
		guard currentViewController != consumer1 else { return }
		currentViewController = consumer1
		addAsAChild(consumer1)
	}
	
	private func initialiseConsumer2() {
		
		guard currentViewController != consumer2 else { return }
		currentViewController = consumer2
		addAsAChild(consumer2)
	}
	
	private func initialiseConsumer3() {
		
		guard currentViewController != consumer3 else { return }
		currentViewController = consumer3
		addAsAChild(consumer3)
	}
	
	private func addAsAChild(_ controller: UIViewController) {
		addChild(controller)
		view.addSubview(controller.view)
		controller.didMove(toParent: self)
	}
	
	private func removeChildViewController(_ controller: UIViewController) {
		controller.willMove(toParent: nil)
		controller.view.removeFromSuperview()
		controller.removeFromParent()
	}
}

