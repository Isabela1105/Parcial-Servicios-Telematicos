# Parcial Servicios Telemáticos

**Estudiante:** Isabela Cabezas  Obregon - Isabella Ortiz Hernandez - Samuel Sepulveda Castaño

**Repositorio:** Parcial-Servicios-Telematicos

---

#  Descripción General

En este parcial se realizó la implementación y configuración de:

1. Servidor DNS maestro con zona directa e inversa.
2. Restricción de transferencia de zona (AXFR).
3. Exposición pública del servidor mediante túnel seguro.
4. Configuración de servidor web Apache.
5. Implementación de compresión GZIP.
6. Verificación mediante herramientas de análisis.

---

# 1. Configuración DNS

Servidor DNS configurado con BIND.

##  Zona Directa

Archivo:

```
dns/db.empresa.local
```

Incluye:

* Registro A
* Registro NS
* Registro SOA

##  Zona Inversa

Archivo:

```
dns/db.192.168.50
```

Incluye:

* Registro PTR
* Resolución IP → Dominio

## Archivos de configuración

```
dns/named.conf.local
dns/named.conf.options
```

Se configuraron:

* Restricción de consultas
* Restricción de transferencia de zona (AXFR)
* Permisos y seguridad

---

## 2. Exposición del Servidor Web con Ngrok

Se utilizó la herramienta **ngrok** para exponer el servidor Apache local a Internet mediante un túnel seguro HTTPS.

### Paso 1: Verificar que Apache esté en ejecución

```bash
sudo systemctl status apache2
```

### Paso 2: Crear túnel HTTP hacia el puerto 80

```bash
ngrok http 80
```

Este comando crea un túnel seguro desde Internet hacia el servidor local que está escuchando en el puerto 80.

### Paso 3: URL pública generada

Ngrok generó la siguiente URL pública:

https://nondiabolical-karl-unludicrous.ngrok-free.dev

Esta URL redirige el tráfico externo al servidor Apache configurado localmente, permitiendo acceso remoto a la página personalizada configurada en el servidor.


# 3. Servidor Web Apache

Se configuró VirtualHost apuntando al directorio:

```
/var/www/parcial/apache_gzip
```

---

#  4. Compresión GZIP

Se habilitó compresión mediante módulo de Apache.

Se verificó presencia del header:

```
Content-Encoding: gzip
```

![Prueba con HTML](HTML.jpeg)

Se observa una reducción del 22% en el tamaño del archivo HTML al habilitar compresión GZIP.
Aunque el archivo es pequeño y la reducción no es muy alta, en aplicaciones con archivos más grandes (JS, CSS) el porcentaje de mejora suele ser considerablemente mayor.


# Conclusión Técnica

La implementación integra servicios de red fundamentales:

* Resolución de nombres mediante DNS.
* Seguridad mediante restricción de transferencia.
* Publicación controlada del servidor web.
* Optimización de rendimiento mediante compresión.

Se validó cada configuración mediante pruebas funcionales y análisis de tráfico.

---

