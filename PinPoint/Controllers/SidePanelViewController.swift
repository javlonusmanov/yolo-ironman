//
//  SidePanelViewController.swift
//  PinPoint
//
//  Created by Javlon Usmanov on 11/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class SidePanelViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var notificationsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var createQuestButton: UIButton!
    @IBOutlet weak var deleteQuestButton: UIButton!
    @IBOutlet weak var questSettingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsButton.layer.cornerRadius = 5
        self.settingsButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.settingsButton.layer.shadowOpacity = 0.7
        self.notificationsButton.layer.cornerRadius = 5
        self.notificationsButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.notificationsButton.layer.shadowOpacity = 0.7
        self.accountButton.layer.cornerRadius = 5
        self.accountButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.accountButton.layer.shadowOpacity = 0.7
        self.logoutButton.layer.cornerRadius = 5
        self.logoutButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.logoutButton.layer.shadowOpacity = 0.7
        self.createQuestButton.layer.cornerRadius = 5
        self.createQuestButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.createQuestButton.layer.shadowOpacity = 0.7
        self.deleteQuestButton.layer.cornerRadius = 5
        self.deleteQuestButton.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.deleteQuestButton.layer.shadowOpacity = 0.7
        self.questSettingLabel.layer.cornerRadius = 5
        self.questSettingLabel.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.questSettingLabel.layer.shadowOpacity = 0.7
    }
}
