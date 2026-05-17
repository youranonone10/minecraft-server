# Minecraft Java Server 🎮

A fully functional Minecraft Java Edition server supporting both legitimate and cracked players, hosted on Railway.

## Features

✅ Supports both online and offline-mode players  
✅ High-performance Paper server  
✅ Optimized JVM settings  
✅ Easy Railway deployment  
✅ Docker containerized  
✅ Support for 1.20.4 (easily upgradeable)  

## Local Setup

### Prerequisites
- Docker & Docker Compose installed
- Git

### Run Locally

```bash
git clone https://github.com/youranonone10/minecraft-server.git
cd minecraft-server
docker-compose up -d
```

Server will start on `localhost:25565`

## Deploy to Railway

### Step 1: Create Railway Account
Go to [railway.app](https://railway.app) and sign up

### Step 2: Connect GitHub Repository
1. In Railway, click "New Project"
2. Select "Deploy from GitHub repo"
3. Select your minecraft-server repository

### Step 3: Configure Environment
1. In Railway project settings, add environment variable: `RAM=2048` (adjust based on your needs)
2. Railway will auto-detect the Dockerfile
3. Your server port will be assigned automatically

### Step 4: Get Connection Info
- Your server URL will be displayed in Railway dashboard
- Port: `25565` (or assigned by Railway)

## How Friends Connect

### For Java Edition Players:
1. Open Minecraft Java Edition
2. Click "Multiplayer" → "Direct Connection"
3. Enter: `<your-railway-url>:25565`
4. Click "Join Server"

### For Cracked Players:
Same as above - since we have `online-mode=false`, any username works!

## Server Management

### Stop Server
```bash
docker-compose down
```

### View Logs
```bash
docker-compose logs -f minecraft
```

### Increase RAM (edit docker-compose.yml)
```yaml
environment:
  RAM: 4096  # In MB
```

## Customization

### Change Game Mode
Edit `server.properties`:
- `gamemode=0` - Survival
- `gamemode=1` - Creative
- `gamemode=2` - Adventure
- `gamemode=3` - Spectator

### Add Plugins (Optional)
1. Create `plugins/` folder
2. Download `.jar` files from [SpigotMC](https://www.spigotmc.org/)
3. Add to Dockerfile:
```dockerfile
COPY plugins/ /minecraft/plugins/
```

### Whitelist Players (Optional)
Set in `server.properties`: `white-list=true`  
Then create `whitelist.json`:
```json
[
  {"name": "YourName", "uuid": "00000000-0000-0000-0000-000000000000"},
  {"name": "Friend", "uuid": "00000000-0000-0000-0000-000000000000"}
]
```

## Performance Tips

- For 5-10 players: 1024-2048 MB RAM
- For 10-20 players: 2048-4096 MB RAM
- For 20+ players: 4096+ MB RAM

## Troubleshooting

**Server won't start?**
- Check RAM allocation
- Verify Java version (need Java 17+)
- Check logs with `docker-compose logs`

**Players can't connect?**
- Check if Railway URL is correct
- Verify port 25565 is exposed
- Try `offline-mode=true` in properties

**Server crashes frequently?**
- Increase RAM in environment
- Check `view-distance` settings
- Review console logs for errors

## Useful In-Game Commands

Once connected to the server:
```
/give @s diamond_pickaxe
/gamemode creative
/setblock ~ ~ ~ diamond_block
/fill x1 y1 z1 x2 y2 z2 diamond_block
/tp @s x y z
/weather clear
/time set day
```

## License
MIT

## Need Help?
Feel free to open an issue!
