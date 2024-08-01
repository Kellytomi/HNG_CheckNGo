# checkngo

 

https://github.com/user-attachments/assets/458a173c-e9cf-4dc5-9ec5-3966bc27117c


## Project Overview
Product Name: Check n' Go
Description: Check n' Go is a mobile application that utilizes NFC (Near Field Communication) technology to streamline visitor check-in and check-out processes at facilities. It aims to enhance operational efficiency, improve security, and enable real-time visitor tracking.

##Objectives
Efficiency: Simplify the process of visitor registration and departure, reducing time and manual effort.
Security: Ensure that visitor data is accurately tracked and stored securely.
Real-Time Tracking: Provide facility administrators with up-to-date information on visitor movements.

## Key Features
1. Visitor Check-In
Visitor Information Input:
Administrator enters the visitors’ details (name, contact information, and purpose of visit) into the app.
NFC Tag Association:
Administrator scans an NFC tag to associate the visitor’s information with the tag.
The app writes the visitor's information to the NFC tag and stores the details in a database.
Visitor receives tag and holds on to it till they are ready to check out.
Confirmation:
A confirmation message is displayed to the administrator, indicating a successful check-in.
3. Visitor Check-Out
NFC Tag Scan:
Administrator scans the same NFC tag they used to check-in the visitor.
Status Update:
The app reads the visitor's info from the tag and updates the visitor's status to check out.
The app records the check-out time.
Confirmation:
A confirmation message is displayed, indicating a successful check-out.
4. Visitor History
Record Management:
Administrators can view a history of all visitors, including their check-in and check-out times.

**Data Overview:**
Displays active visitors i.e visitors that are still checked in and haven't checked out yet.
Provides an overview of visitor activity, assisting in managing records efficiently.
Administrators can view the details of a particular entry, including the purpose of visit.

**Database:**
A secure database to store visitor details, check-in/check-out times, and other relevant data. Isar database
is being used for storage

**User Roles and Permissions**
Visitors:
- Register their visit with the Admin and is given an NFC tag while going into the premises.
- Uses the NFC tag to check out with the Admin and drops the NFC tag on their way out.
Administrators:
- Register visitors and check-in with their details using the NFC tag.
- Check-out visitors on the app using the NFC tag.
- Receive confirmation messages for check-in and check-out.
- View and manage visitor records.
- Access historical data on visitor activities.

