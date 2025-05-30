#!/bin/bash

echo "🔧 Installerar Nikola Binary Live AI..."

# Rensa gammal mapp om den finns
rm -rf /home/$USER/nikola_binary_live
git clone https://github.com/BillSKO/nikolaDeploy.git /home/$USER/nikola_binary_live

cd /home/$USER/nikola_binary_live

# Skapa virtuellt Python-miljö
python3 -m venv venv
source venv/bin/activate

# Installera krav
pip install --upgrade pip
pip install -r requirements.txt

# Starta bot i bakgrunden
nohup python3 main.py > logs.txt 2>&1 &

echo "✅ Nikola är igång. Logs sparas i logs.txt"
