# Server Performance Stats

## 📋 Tentang Projek

Projek ini adalah sebuah tool monitoring server yang dibuat dengan PowerShell untuk Windows. Script ini memberikan informasi kinerja server secara real-time dengan format yang mudah dibaca, mencakup penggunaan CPU, memori, disk, dan proses yang sedang berjalan.

## ✨ Fitur

Script ini menyediakan fitur-fitur berikut:

### 🖥️ System Overview

- **Total CPU Usage** - Menampilkan persentase penggunaan CPU saat ini
- **Total Memory Usage** - Menampilkan penggunaan memori total dengan rincian:
  - Memori yang digunakan (Used)
  - Memori yang tersedia (Free)
  - Persentase penggunaan memori

### 💾 Storage Information

- **Total Disk Usage** - Menampilkan penggunaan disk dengan rincian:
  - Kapasitas disk total
  - Ruang yang digunakan
  - Ruang yang tersedia
  - Persentase penggunaan disk

### 🔍 Process Monitoring

- **Top 5 Processes by CPU Usage** - Menampilkan 5 proses dengan penggunaan CPU tertinggi
- **Top 5 Processes by Memory Usage** - Menampilkan 5 proses dengan penggunaan memori tertinggi

## 🚀 Cara Penggunaan

1. Buka PowerShell sebagai Administrator
2. Jalankan script:
   ```powershell
   .\server-stats.ps1
   ```

## 📝 Output Sample

Script akan menampilkan output seperti berikut:

```
=== SERVER PERFORMANCE STATS ===

[CPU USAGE]
Total CPU Usage: 45.2%

[MEMORY USAGE]
Total Memory: 16.0 GB
Used Memory: 8.5 GB
Free Memory: 7.5 GB
Memory Usage: 53.1%

[DISK USAGE]
Total Disk: 500.0 GB
Used Disk: 250.0 GB
Free Disk: 250.0 GB
Disk Usage: 50.0%

[TOP 5 PROCESSES BY CPU]
1. chrome.exe - 12.5%
2. vscode.exe - 8.2%
3. powershell.exe - 5.1%
4. system.exe - 3.8%
5. svchost.exe - 2.5%

[TOP 5 PROCESSES BY MEMORY]
1. chrome.exe - 1.2 GB
2. vscode.exe - 850 MB
3. powershell.exe - 450 MB
4. system.exe - 320 MB
5. svchost.exe - 280 MB
```

## 🛠️ Teknologi

- **PowerShell** - Scripting language untuk Windows
- **WMI (Windows Management Instrumentation)** - Untuk query system information
- **Get-Counter** - Untuk monitoring performance counters

## 📚 Referensi

Project ini dibuat sebagai bagian dari learning path dari **roadmap.sh**:

🔗 [Server Stats Project - roadmap.sh](https://roadmap.sh/projects/server-stats)

## 🎯 Tujuan Learning

Project ini membantu dalam mempelajari:

- PowerShell scripting fundamentals
- System monitoring techniques
- WMI queries
- Performance counter utilization
- Data formatting and presentation

## 📄 Lisensi

Project ini dibuat untuk tujuan educational dan learning.

---

_Dibuat untuk memenuhi requirements dari roadmap.sh projects_
