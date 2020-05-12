//
//  ViewController.swift
//  DrawingPad
//
//  Created by RUPAM LAHA on 12/05/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController {

    
    @IBOutlet weak var drawingCanvas: PKCanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupDrawingCanvas()
    }
    
    //Setting up canvas view and pencil tool picker
    
    private func setupDrawingCanvas(){
        
        if let window = view.window, let drawingToolPicker = PKToolPicker.shared(for: window){
            drawingToolPicker.setVisible(true, forFirstResponder: drawingCanvas)
            drawingToolPicker.addObserver(drawingCanvas)
            drawingCanvas.becomeFirstResponder()
            
        }
    }

    //Action of Snap bar button
    @IBAction func snapTapped(_ sender: UIBarButtonItem) {
        
        guard let snapVC = self.storyboard?.instantiateViewController(identifier: "SnapedViewController") as? SnapedViewController else { return }
        let snapShot = UIGraphicsImageRenderer(bounds: drawingCanvas.bounds).image{_ in
            view.drawHierarchy(in: drawingCanvas.bounds, afterScreenUpdates: true)
        }
        snapVC.img = snapShot
        present(snapVC, animated: true, completion: nil)
        
        
    }
    
    //Action of Clear bar button
    @IBAction func clearTapped(_ sender: UIBarButtonItem) {
        
        drawingCanvas.drawing = PKDrawing()
        
    }
}

