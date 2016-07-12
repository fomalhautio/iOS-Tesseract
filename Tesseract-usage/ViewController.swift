//
//  ViewController.swift
//  Tesseract-usage
//
//  Created by blueMix on 7/12/16.
//  Copyright © 2016 Fomalhaut.io. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {

    
    
    // MARK: Outlets
    
    @IBOutlet weak var ocrSampleImage: UIImageView!
    @IBOutlet weak var orcText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tesseract: G8Tesseract = G8Tesseract(language: "eng")
        tesseract.engineMode = .TesseractOnly
        //tesseract.pageSegmentationMode = .Auto
        tesseract.charWhitelist = "@.(){}/\\!*&#0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //tesseract.charWhitelist = "0123456789";
        //tesseract.charBlacklist = "@.(){}/\\!*&#abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

        tesseract.maximumRecognitionTime = 10.0
        
        tesseract.delegate = self
        
        
        let ocrSample = UIImage(named: "Image5")
        tesseract.image = ocrSample?.fixOrientation().g8_blackAndWhite()
        
        tesseract.recognize()

        let recognizedText = tesseract.recognizedText
        
        print("recognizedText: \(recognizedText)")
        
        ocrSampleImage.image = tesseract.image
        orcText.text = recognizedText
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func progressImageRecognitionForTesseract(tesseract: G8Tesseract!) {
        print("\(tesseract.progress)")
    }


}

