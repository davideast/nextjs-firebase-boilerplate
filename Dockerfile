FROM node:12-alpine AS builder
WORKDIR /build

COPY package.json yarn.lock ./
RUN yarn

COPY . .
RUN yarn build && rm -rf .next/cache

FROM node:12-alpine
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --production

COPY --from=builder /build/.next .next
COPY next.config.js .
COPY public ./public
RUN mkdir pages

CMD ["yarn", "run"]
