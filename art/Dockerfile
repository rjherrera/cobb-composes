FROM node:24-slim

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@11.22.0 --activate

COPY src/package.json src/pnpm-lock.yaml src/pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

COPY src/ ./

ARG VITE_CONVEX_URL
ENV VITE_CONVEX_URL=$VITE_CONVEX_URL
RUN pnpm build

RUN pnpm install --frozen-lockfile --prod

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV NODE_ENV=production
ENTRYPOINT ["/entrypoint.sh"]
