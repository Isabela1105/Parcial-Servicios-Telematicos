$TTL    604800
@   IN  SOA servidor.isabelacabezas.com. admin.isabelacabezas.com. (
        1       ; Serial
        604800
        86400
        2419200
        604800 )

@           IN  NS  servidor.isabelacabezas.com.
servidor    IN  A   192.168.50.3
parcial     IN  A   192.168.50.3
