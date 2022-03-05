# template-svelte-ts

Setup

- Svelte-kit
- Bootstrap 5
- SASS
- Typescript
- Docker
- Tests
- Github actions
  - CI pipeline
  - Dependabot (weekly)

## Requirements

- node v16.14.0 (LTS)
- nvm (optional)
- docker (for development)

## Development

Run `npm run dev`, or `npm run dev:docker` for development running in docker.

## Tools

### Prettier

Code formatter. Read more [here](https://prettier.io).  
Prettier is integrated to ESLint and configured to handle code formatting.

- Run: `npm run format`
- Configuration file: [.prettierrc.json](./app/.prettierrc.json).

See [options](https://prettier.io/docs/en/options.html).

### ESLint

Finds and fixes some problems. Read more [here](https://eslint.org).

- Run `npm run lint`.
- Configuration in [.eslintrc.cjs](./app/.eslintrc.cjs).

See [rules](https://eslint.org/docs/rules/).

### TypeScript

Read more [here](https://www.typescriptlang.org/docs/).

- Configuration in [.tsconfig.json](./app/.tsconfig.json).

See [rules](https://eslint.org/docs/rules/).

### Testing

Tests are setup using [Jest](https://jestjs.io/) and Svelte Testing Library, which is a part of [Testing Library](https://testing-library.com/).

- Run tests with `npm run test`, or `npm run test:watch`.
- Configuration in [.jest.config.json](./app/.jest.config.json).

See [docs](https://testing-library.com/docs/).

Packages used for testing

- `jest` to run the tests.
- `ts-jest` to let you write your tests in TypeScript.
- `@testing-library/svelte` for some useful functions to test your Svelte components with.
- `@testing-library/jest-dom` for handy DOM matcher functions like `toBeInTheDocument`.
- `svelte-jester` to compile Svelte components for Jest, so that Jest can use them.
- `@types/jest` to get TS to stop complaining about Jest’s globals like `expect`.

### VSCode extensions

- [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

Note: Add recommended extensions to [exensions.json](./app/.vscode/extensions.json).

### nvm (Node Version Manager)

- Install nvm ([instructions](https://github.com/nvm-sh/nvm)).
- Install a node version, e.g. `nvm install v16.13.2`.
- Run `nvm use` in root folder and node will be changed to version in [.nvmrc](./app/.nvmrc).  
  Also check out Deeper Shell Integration [here](https://github.com/nvm-sh/nvm#deeper-shell-integration).

## Infrastructure

Infrastructure by code using [terraform](https://www.terraform.io/intro).

#### Setup

##### Mac OS

- 1. Update brew `brew update`

- 2. Install Terraform

  - Add hashicorp tap `brew tap hashicorp/tap`
  - Install `brew install hashicorp/tap/terraform`

- 3. Install Azure CLI

  - Install `brew install azure-cli`

- 4. Login to Azure `az login`

#### tfenv

Install

- `brew install tfenv`

`git clone https://github.com/tfutils/tfenv.git ~/.tfenv`
`echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile`
`echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.zprofile`

https://github.com/tfutils/tfenv

- Install version `tfenv install 1.1.6`
- Activate version `tfenv use 1.1.6`

###
