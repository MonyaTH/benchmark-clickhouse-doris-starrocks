# Ejecutar los scripts en segundo plano y guardar los procesos
$process1 = Start-Process -FilePath "powershell.exe" -ArgumentList "-File ./crearConector_shoe_clickstream.ps1" -NoNewWindow -PassThru
$process2 = Start-Process -FilePath "powershell.exe" -ArgumentList "-File ./crearConector_shoe_customers.ps1" -NoNewWindow -PassThru
$process3 = Start-Process -FilePath "powershell.exe" -ArgumentList "-File ./crearConector_shoe_orders.ps1" -NoNewWindow -PassThru
$process4 = Start-Process -FilePath "powershell.exe" -ArgumentList "-File ./crearConector_shoes.ps1" -NoNewWindow -PassThru

# Esperar a que todos los procesos terminen
$process1.WaitForExit()
$process2.WaitForExit()
$process3.WaitForExit()
$process4.WaitForExit()
