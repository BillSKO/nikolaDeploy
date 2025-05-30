#!/bin/bash
echo "🔧 Installerar Nikola Binary Live AI..."
git clone https://github.com/BillSKO/nikolaDeploy.git ~/nikola_binary_live || {
    echo "❌ Misslyckades att klona repo. Kontrollera att det finns och är offentligt."
    exit 1
}
cd ~/nikola_binary_live
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt || echo "⚠️ Varning: requirements.txt saknas eller är tom."
nohup python3 main.py > logs.txt 2>&1 &
echo "✅ Nikola är igång. Logs sparas i logs.txt"
