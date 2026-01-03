# Kode ini menggunakan WMI (Windows Management Instrumentation) untuk berbicara langsung dengan perangkat keras Windows.

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "       STATISTIK KINERJA SERVER (WINDOWS)    " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Waktu: $(Get-Date)"
Write-Host ""

# --- 1. Mengambil data memori total, uptime, dan nama OS. ---
Write-Host "### 1. INFORMASI SISTEM ###" -ForegroundColor Yellow
Write-Host "Sistem Operasi : $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Host "Uptime         : $((Get-CimInstance Win32_OperatingSystem).LastBootUpTime)"
Write-Host "User Saat Ini  : $env:USERNAME"
Write-Host ""

# --- 2. Mengambil data beban CPU secara real-time. ---
Write-Host "### 2. PENGGUNAAN CPU ###" -ForegroundColor Yellow
# Mendapatkan rata-rata load CPU semua core
$cpuUsage = (Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
Write-Host "Total Penggunaan CPU: $cpuUsage%"
Write-Host ""

# --- 3. Mengambil data penggunaan memori secara real-time. ---
Write-Host "### 3. PENGGUNAAN MEMORI ###" -ForegroundColor Yellow
$os = Get-CimInstance Win32_OperatingSystem
$memTotal = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$memFree = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$memUsed = $memTotal - $memFree
$memPercent = [math]::Round(($memUsed / $memTotal) * 100, 2)

Write-Host "Total Memori     : $memTotal GB"
Write-Host "Memori Terpakai  : $memUsed GB ($memPercent%)"
Write-Host "Memori Tersisa   : $memFree GB"
Write-Host ""

# --- 4. Mengambil data penggunaan disk (C:) secara real-time. ---
Write-Host "### 4. PENGGUNAAN DISK (C:) ###" -ForegroundColor Yellow
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$diskTotal = [math]::Round($disk.Size / 1GB, 2)
$diskFree = [math]::Round($disk.FreeSpace / 1GB, 2)
$diskUsed = $diskTotal - $diskFree
$diskPercent = [math]::Round(($diskUsed / $diskTotal) * 100, 2)

Write-Host "Total Disk       : $diskTotal GB"
Write-Host "Disk Terpakai    : $diskUsed GB ($diskPercent%)"
Write-Host "Disk Tersedia    : $diskFree GB"
Write-Host ""

# --- 5. Mengambil data 5 proses teratas (CPU) secara real-time. ---
Write-Host "### 5. PROSES TERATAS (PENGGUNAAN CPU) ###" -ForegroundColor Yellow
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 | Format-Table Name, CPU, Id -AutoSize
Write-Host ""

# --- 6. Mengambil data 5 proses teratas (MEMORI) secara real-time. ---
Write-Host "### 6. PROSES TERATAS (PENGGUNAAN MEMORI) ###" -ForegroundColor Yellow
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 | Format-Table Name, @{Name = 'Memory(MB)'; Expression = { [math]::Round($_.WorkingSet / 1MB, 2) } }, Id -AutoSize
Write-Host ""

Write-Host "============================================"
Write-Host "         Selesai Menganalisis              " -ForegroundColor Green
Write-Host "============================================"