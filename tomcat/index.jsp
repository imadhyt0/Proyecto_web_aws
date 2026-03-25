<%@ page import="java.util.Date" %>
<%@ page import="java.lang.Runtime" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Aplicación Java | Tomcat</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #eceff1; padding: 40px; }
        .container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 600px; margin: auto; border-top: 5px solid #D22128; }
        h1 { color: #D22128; margin-top: 0; }
        p { color: #555; }
        .info-box { background: #f8f9fa; padding: 15px; border-left: 4px solid #D22128; margin-top: 20px; font-family: monospace; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Servidor Tomcat Funcionando</h1>
        <p>El proxy inverso ha redirigido esta petición al contenedor de Java. El siguiente bloque de datos está siendo calculado por la Máquina Virtual de Java (JVM) en este instante:</p>
        
        <div class="info-box">
            <strong>Fecha de la petición:</strong> <%= new Date() %><br><br>
            <strong>Memoria libre en JVM:</strong> <%= Runtime.getRuntime().freeMemory() / 1024 / 1024 %> MB<br>
            <strong>Procesadores disponibles:</strong> <%= Runtime.getRuntime().availableProcessors() %>
        </div>
    </div>
</body>
</html>
