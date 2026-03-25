FROM debian:bullseye

# Instalamos Apache y Certbot para los certificados reales
RUN apt-get update && apt-get install -y apache2 certbot python3-certbot-apache

# Criterio C: Activamos los módulos de Apache necesarios
RUN a2enmod proxy proxy_http ssl rewrite ldap authnz_ldap headers

# Copiamos nuestra configuración de Sitios Virtuales
COPY proxy.conf /etc/apache2/sites-available/000-default.conf

# TRUCO DE ORO: Le decimos a Apache que no se queje del certificado autofirmado interno del contenedor LDAP
RUN echo "LDAPVerifyServerCert Off" >> /etc/apache2/apache2.conf

EXPOSE 80 443

CMD ["apachectl", "-D", "FOREGROUND"]
