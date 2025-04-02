# 使用Node.js官方镜像作为基础镜像
FROM node:18

# 设置工作目录
WORKDIR /app

# 设置npm的registry
RUN npm config set registry https://registry.npmmirror.com

# 安装pnpm
RUN npm install -g pnpm

# 复制package.json和pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装项目依赖
RUN pnpm install

# 复制项目文件
COPY . .

# 暴露应用的端口
EXPOSE 3000

# 设置启动命令
CMD ["npm", "run", "dev"]