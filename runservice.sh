#!/bin/bash

# Direktori Proyek
FeDir="Smart-Traffic-Management-Frontend"
BeDir="Smart-Traffic-Management-Backend"
SimDir="Smart-Traffic-Management-DataSimulator"

echo "🚀 Memulai backend..."
cd "$BeDir" || { echo "❌ Direktori backend tidak ditemukan!"; exit 1; }

# Cek dan aktifkan virtual environment
if [ -d ".venv" ]; then
    echo "✅ Virtual environment ditemukan."
    source .venv/bin/activate || source .venv/Scripts/activate || { echo "❌ Gagal mengaktifkan virtual environment"; exit 1; }
else
    echo "⚠️ Virtual environment tidak ditemukan!"
    exit 1
fi

# Jalankan backend
python -u main.py &
BE_PID=$!
sleep 5  # Tunggu beberapa detik untuk memastikan backend berjalan

# Cek apakah backend masih berjalan
if ps -p $BE_PID > /dev/null; then
    echo "✅ Backend berjalan dengan sukses."
else
    echo "❌ Backend gagal berjalan!"
    exit 1
fi

# Jalankan Frontend
echo "🚀 Memulai frontend..."
cd "../$FeDir" || { echo "❌ Direktori frontend tidak ditemukan!"; exit 1; }
npm install && npm run dev &
FE_PID=$!
sleep 5

if ps -p $FE_PID > /dev/null; then
    echo "✅ Frontend berjalan dengan sukses."
else
    echo "❌ Frontend gagal berjalan!"
    exit 1
fi

# Jalankan Data Simulator
echo "🚀 Memulai data simulator..."
cd "../$SimDir" || { echo "❌ Direktori data simulator tidak ditemukan!"; exit 1; }
npm install && node main.js &
SIM_PID=$!
sleep 5

if ps -p $SIM_PID > /dev/null; then
    echo "✅ Data Simulator berjalan dengan sukses."
else
    echo "❌ Data Simulator gagal berjalan!"
    exit 1
fi

echo "🎉 Semua layanan berjalan dengan sukses!"
wait $BE_PID $FE_PID $SIM_PID
