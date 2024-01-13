FROM node:18 AS base-image
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build


FROM node:18-alpine AS production
WORKDIR /app
COPY --from=base-image /app/build /app
CMD ["npm", "start"]