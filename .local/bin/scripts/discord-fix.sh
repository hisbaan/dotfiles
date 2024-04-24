#!/usr/bin/env bash

cd ~/.config/discord/*/modules/discord_desktop_core || exit
npx asar extract core.asar core
sed -i 's/function setTrayIcon(icon) {/function setTrayIcon(icon) {\r\nreturn/g' core/app/systemTray.js
npx asar pack core core.asar
