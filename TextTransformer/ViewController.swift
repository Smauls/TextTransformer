//
//  ViewController.swift
//  TextTransformer
//
//  Following tutorial by HackingwithSwift.com
//
//  Created by Patrick McMenomy on 9/27/21.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
    @IBOutlet weak var input: NSTextField!
    @IBOutlet weak var type: NSSegmentedControl!
    @IBOutlet weak var output: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typeChanged(self)    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func typeChanged(_ sender: Any) {
        switch type.selectedSegment{
        case 0:
            output.stringValue = rot13(input.stringValue)
        case 1:
            output.stringValue = similar(input.stringValue)
        case 2:
            output.stringValue = strike(input.stringValue)
        default:
            output.stringValue = zalgo(input.stringValue)
        }
    }
    
    
    @IBAction func copyToPasteboard(_ sender: Any) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(output.stringValue, forType: .string)
    }
    
    func controlTextDidChange(_ obj: Notification) {
        typeChanged(self)
    }
    
    func rot13(_ input: String) -> String {
        return "ROT13: " + input
    }
    
    func similar(_ input: String) -> String {
        var output = input
        
        output = output.replacingOccurrences(of: "a", with: "а")
        output = output.replacingOccurrences(of: "e", with: "е")
        output = output.replacingOccurrences(of: "i", with: "і")
        output = output.replacingOccurrences(of: "o", with: "о")
        
        output = output.replacingOccurrences(of: "A", with: "А")
        output = output.replacingOccurrences(of: "E", with: "Е")
        output = output.replacingOccurrences(of: "I", with: "І")
        output = output.replacingOccurrences(of: "O", with: "О")
        
        return output
    }
    
    func strike(_ input: String) -> String {
        var output = ""
        
        for  letter in input {
            output.append(letter)
            
            output.append("\u{0335}")
        }
        
        return output
        
    }
    
    func zalgo(_ input: String) -> String {
        return "Zalgo: " + input
    }
    
}

