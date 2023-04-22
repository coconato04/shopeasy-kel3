# shopeasy - backend test

A "Marketplace" themed Flutter project by Kelompok 3. Insert flavor text here.

## Backend Testing Branch

"Don't break the main branch" - Sun Tzu  
Backend used: Firebase  
Database: Firestore

## Changes
- Register with email and password + email verification
- Login with email and password
- Login with Google
- Login with Facebook (keytool will not cooperate so temporarily scrapped)
- Signout (AuthService code works, but still placeholder UI on notification button instead)
- Resend Email Verification (AuthService code is there but not tested, needs UI)
- Forgot password (AuthService code is there but not tested, needs UI)

## Current Errors/To-Do List
- UI pop-ups for messages (login failed, need verification, etc) 
- Navbar (rootbarapp) missing (possibly logsig.dart issue)
- Store user profile
- Store shop profile
- Store product information
- Forget Password (need UI)
- Resend email verification (need UI)
- Does not attempt to sign out when signing out after relogging (TLDR: no two signout in one session).
- Pollution of logs when inputting text through physical keyboard (low priority)