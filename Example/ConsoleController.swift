//
//  ConsoleController.swift
//  Example
//
//  Created by Flavius Condurache on 03/09/2017.
//  Copyright © 2017 emqtt.io. All rights reserved.
//

import UIKit
import CocoaMQTT

class ConsoleController: UIViewController {
    
    var mqtt: CocoaMQTT?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        print("Console openned!")
        
        mqttSetting()
        mqtt!.connect()
    }
    
    func mqttSetting() {
        let clientID = "CocoaMQTT-terminal-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "192.168.10.215", port: 1883)
        mqtt!.username = ""
        mqtt!.password = ""
        mqtt!.willMessage = CocoaMQTTWill(topic: "/will", message: "dieout")
        mqtt!.keepAlive = 60
    }
}
