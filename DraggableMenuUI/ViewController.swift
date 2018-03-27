//
//  ViewController.swift
//  DraggableMenuUI
//
//  Created by Ashish Verma on 3/26/18.
//  Copyright © 2018 EatSleepRide. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var translation: CGPoint!
	var startPosition: CGPoint! //Start position for the gesture transition
	var originalHeight: CGFloat = 0 // Initial Height for the UIView
	var difference: CGFloat!

	override func viewDidLoad() {
		super.viewDidLoad()
		originalHeight = dragView.frame.height
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBOutlet weak var dragView: UIView! // UIView with UIPanGestureRecognizer

	@IBOutlet var gestureRecognizer: UIPanGestureRecognizer!

	@IBAction func viewDidDragged(_ sender: UIPanGestureRecognizer) {

		if sender.state == .began {
			startPosition = gestureRecognizer.location(in: dragView) // the postion at which PanGestue Started
		}

		if sender.state == .began || sender.state == .changed {
			translation = sender.translation(in: self.view)
			sender.setTranslation(CGPoint(x: 0.0, y: 0.0), in: self.view)
			let endPosition = sender.location(in: dragView) // the posiion at which PanGesture Ended
			difference = endPosition.y - startPosition.y
			var newFrame = dragView.frame
			newFrame.origin.x = dragView.frame.origin.x
			newFrame.origin.y = dragView.frame.origin.y + difference //Gesture Moving Upward will produce a negative value for difference
			newFrame.size.width = dragView.frame.size.width
			newFrame.size.height = dragView.frame.size.height - difference //Gesture Moving Upward will produce a negative value for difference
			dragView.frame = newFrame
		}

		if sender.state == .ended || sender.state == .cancelled {
			//Do Something
		}
	}
}


















