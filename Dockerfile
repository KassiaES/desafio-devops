# Versão específica do WordPress
FROM wordpress:php8.3-fpm-alpine

# Exposição da porta 80 para o WordPress
EXPOSE 80

# Adição do usuário "kassia" com o ID 3375
RUN useradd -u 3375 kassia

# Ajuste para o usuário não-root
USER kassia

