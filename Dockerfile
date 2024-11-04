FROM node:22.11.0-alpine3.19 as build
WORKDIR /opt

COPY src ./src
COPY package.json yarn.lock tsconfig.json ./

RUN yarn && yarn build

USER node

FROM node:22.11.0-alpine3.19
WORKDIR /opt

COPY --from=build /opt/package.json ./package.json
COPY --from=build /opt/node_modules ./node_modules
COPY --from=build /opt/build ./build

ENV TZ America/Vancouver

EXPOSE 3000
CMD ["node", "build/main.js"]
