# Etapa 1: Construcción
FROM node:latest AS builder

# Establecer directorio de trabajo
WORKDIR /app

# Copiar los archivos de la aplicación
COPY package.json package-lock.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Construir la aplicación SvelteKit
RUN npm run build

# Etapa 2: Ejecutar
FROM node:slim AS runner

# Establecer directorio de trabajo
WORKDIR /app

# Copiar los archivos necesarios desde la etapa de construcción
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json /app/package-lock.json ./

# Instalar solo las dependencias de producción
RUN npm install --production

# Exponer el puerto en el que correrá la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "build"]

