//
//  LocalNotificationManager.swift
//  ToDo List
//
//  Created by Brandon Boey on 3/8/20.
//  Copyright © 2020 Brandon Boey. All rights reserved.
//

import UIKit
import UserNotifications


struct LocalNotificationManager {
    static func authorizeLocalNotifications(viewController: UIViewController) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else {
                print("Error \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Notification authorization granted")
            } else {
                print("The user has denied notifications")
                DispatchQueue.main.async {
                    viewController.oneButtonAlert(title: "User has not allowed notifications", message: "Open Settings app, select To Do List > Notifications > Allow Notifications")

                }
            }
        }
    }
    static func isAuthorized(completed: @escaping (Bool)->() ) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard error == nil else {
                print("Error \(error!.localizedDescription)")
                completed(false)
                return
            }
            if granted {
                print("Notification authorization granted")
                completed(true)
            } else {
                print("The user has denied notifications")
                completed(false)
            }
        }
    }
   static func setCalendarNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        // create content:
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        //register request with the notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("Error")
            } else {
                print("Notification scheduled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
}
