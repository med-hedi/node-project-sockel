#!/bin/bash

# Stop on first error
set -e

echo "🚀 Setup ESLint + Prettier + Husky + lint-staged for Node.js + TypeScript"

# 1️⃣ Installer les dépendances dev
npm install --save-dev \
  eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin \
  prettier husky lint-staged \
  typescript ts-node jest ts-jest

echo "✅ Dépendances installées"

# 2️⃣ Créer .eslintrc.json
cat > .eslintrc.json <<EOL
{
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "parserOptions": {
    "ecmaVersion": 2021,
    "sourceType": "module"
  },
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "double"]
  }
}
EOL

echo "✅ .eslintrc.json créé"

# 3️⃣ Créer .prettierrc
cat > .prettierrc <<EOL
{
  "semi": true,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 80,
  "tabWidth": 2,
  "bracketSpacing": true,
  "arrowParens": "always",
  "endOfLine": "lf"
}
EOL

echo "✅ .prettierrc créé"

# 4️⃣ Créer .prettierignore
cat > .prettierignore <<EOL
node_modules
dist
build
coverage
EOL

echo "✅ .prettierignore créé"

# 5️⃣ Initialiser Husky
npx husky install
npm set-script prepare "husky install"

# 6️⃣ Créer hook pre-commit
npx husky add .husky/pre-commit "npx lint-staged"
chmod +x .husky/pre-commit

# 7️⃣ Créer hook pre-push pour Jest
npx husky add .husky/pre-push "npm test"
chmod +x .husky/pre-push

echo "✅ Husky et hooks créés"

# 8️⃣ Configurer lint-staged dans package.json
npx json -I -f package.json -e 'this["lint-staged"]={"**/*.{ts,tsx,js}":["eslint --fix","prettier --write"],"**/*.{json,md}":["prettier --write"]}'

echo "✅ lint-staged configuré"

echo "🎉 Setup terminé ! Tu peux maintenant committer et tes fichiers seront automatiquement lintés et formatés."
