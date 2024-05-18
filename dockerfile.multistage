
FROM node:latest AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:slim AS runner
WORKDIR /app
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json /app/package-lock.json ./
RUN npm install --production
EXPOSE 3000
CMD ["node", "build"]

