<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Backend | PHP</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f4f9; color: #333; padding: 40px; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 600px; margin: auto; border-top: 5px solid #4F5D95; }
        h1 { color: #4F5D95; margin-top: 0; }
        .data-row { margin-bottom: 15px; padding-bottom: 10px; border-bottom: 1px solid #eee; }
        .label { font-weight: bold; color: #666; }
        .value { float: right; color: #000; font-family: monospace; font-size: 1.1em; }
        .success { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Motor PHP Activo</h1>
        <p>Esta página está siendo generada y procesada en tiempo real por el contenedor backend de PHP, demostrando que el Proxy Inverso enruta correctamente el tráfico dinámico.</p>
        
        <div class="data-row">
            <span class="label">Hora del servidor AWS:</span>
            <span class="value"><?php echo date('Y-m-d H:i:s'); ?></span>
        </div>
        <div class="data-row">
            <span class="label">Versión del motor PHP:</span>
            <span class="value"><?php echo phpversion(); ?></span>
        </div>
        <div class="data-row">
            <span class="label">IP de tu navegador:</span>
            <span class="value"><?php echo $_SERVER['REMOTE_ADDR']; ?></span>
        </div>
        <div class="data-row">
            <span class="label">Estado de conexión:</span>
            <span class="value success">Establecida</span>
        </div>
    </div>
</body>
</html>
