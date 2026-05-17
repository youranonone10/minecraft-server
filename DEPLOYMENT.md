# Railway Deployment Guide

## Quick Start (5 minutes)

### 1. Sign Up on Railway
- Go to https://railway.app
- Click "Start Project"
- Sign up with GitHub

### 2. Create New Project
- Click "New Project"
- Select "Deploy from GitHub repo"
- Authenticate with GitHub
- Select `youranonone10/minecraft-server`

### 3. Configure Variables
Railway will auto-detect the Dockerfile. Add this environment variable:

**Environment Variables:**
```
RAM=2048
```

Adjust RAM based on player count:
- 5 players: 1024 MB
- 10 players: 2048 MB
- 15 players: 3072 MB
- 20+ players: 4096 MB

### 4. Deploy
- Railway will automatically build and deploy
- Wait 5-10 minutes for deployment to complete
- Once done, you'll see a URL like: `your-project.up.railway.app`

### 5. Share with Friends
Tell your friends to connect using:
```
Server Address: <your-railway-url>:25565
```

## Getting Your Server URL

1. Go to Railway Dashboard
2. Select your minecraft-server project
3. Click on the deployment
4. Look for "Public URL" or "Domains"
5. Use that URL with port 25565

## Important Notes

⚠️ **Railway Free Tier Limits:**
- Free tier has limited runtime hours
- Consider paid tier for 24/7 uptime
- Check Railway pricing: https://railway.app/pricing

⚠️ **Server Persistence:**
- The world data is stored in Railway's ephemeral storage
- It will be reset on deployments
- For persistent storage, upgrade to Railway's paid plan or add a database

## Monitoring

View server logs:
1. Go to Railway Dashboard
2. Click your project
3. Click "Logs" tab
4. Watch real-time logs

## Updating Server Version

To update to a newer Minecraft version:

1. Edit `Dockerfile`
2. Change the version number:
```dockerfile
RUN curl -o server.jar https://launcher.papermc.io/v1/builds/paper/1.21/latest/downloads/paper-1.21-latest.jar
```
3. Commit and push to GitHub
4. Railway will auto-redeploy

## Stopping/Restarting

**To pause deployment:**
1. Go to Railway Dashboard
2. Click your project
3. Go to "Settings"
4. Click "Remove" to pause

**To restart:**
1. Click "Deploy" again
2. Or just push new commits to GitHub

## Adding Plugins

1. Create a `plugins/` folder in your repo
2. Download plugin `.jar` files
3. Add to Dockerfile:
```dockerfile
COPY plugins/ /minecraft/plugins/
```
4. Push to GitHub and Railway will redeploy

## Troubleshooting

**Server not starting?**
- Check Railway logs for errors
- Verify RAM setting is valid
- Check if Dockerfile syntax is correct

**Players can't connect?**
- Verify the public URL is correct
- Make sure port 25565 is exposed
- Check server is running in Railway dashboard

**Server keeps crashing?**
- Increase RAM allocation
- Reduce `view-distance` in server.properties
- Check for plugin conflicts

## Support

For Railway issues: https://docs.railway.app/
For Minecraft issues: Check the README.md in the repo
