# Multiplayer Car Racing Game with Chatting Room

A completely Responsive Multiplayer Car Racing Game with Chatting Room - Works on Android, iOS, Web & Desktop! 

## Features
- Create/Join Room
- Play Realtime
- Display Points
- Real-time Chatting room
- Responsive Glow Themed UI
- Cross Platform Game

## Installation
Install dependencies (Client Side)
change username, password and ip to yours (in the ./index.js and the socket_client.dart)
```bash
flutter pub get
```

Install dependencies (Server Side)

```bash
cd server && npm install
```

Start the server

```bash
npm run dev
```

Configure for MacOS:
Head to macos/Runner and make sure the following keys are present in DebugProfile.entitlements and Release.entitlements
```bash
<key>com.apple.security.network.server</key>
<true/>
<key>com.apple.security.network.client</key>
<true/>
```

Run App
```bash
flutter run
```

## Tech Used
**Server**: Node.js, Express, Socket.io, Mongoose, MongoDB

**Client**: Flutter, Provider
    

# Multi-player-Car-Racing-game-chatting-room---using-Flutter-v4
# Multi-player-Car-Racing-game-chatting-room---using-Flutter-v4
