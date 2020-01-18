//
//  NotificationManager.swift
//  UIViewModel
//
//  Created by Dumitru Tabara on 1/9/20.
//  Copyright © 2020 Dumitru Tabara. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    var notifications = [SimpleNotification]()
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in

            if granted == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in

            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
    
    private func scheduleNotifications() {
        for notification in notifications {
            let content      = UNMutableNotificationContent()
            content.title    = notification.title
            content.sound    = .default
            
            var dateComponent = DateComponents()
            let calendar = Calendar.current
            
            dateComponent.second = 10 + calendar.component(.second, from: notification.date)
            dateComponent.year = calendar.component(.year, from: notification.date)
            dateComponent.day = calendar.component(.day, from: notification.date)
            dateComponent.month = calendar.component(.month, from: notification.date)
            dateComponent.weekday = calendar.component(.weekday, from: notification.date)
            dateComponent.hour = calendar.component(.hour, from: notification.date)
            dateComponent.minute = calendar.component(.minute, from: notification.date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(notification.id)")
            }
        }
    }
}
