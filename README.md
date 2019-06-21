# React App Configs
Configuration Management option for React App configs with Environment Variable override.

## Development Stack

- **Confd** ([kelseyhightower/confd](https://github.com/kelseyhightower/confd))
- **React App:** ([facebook/create-react-app](https://github.com/facebook/create-react-app))
- **Supervisor** ([Supervisor/supervisor](https://github.com/Supervisor/supervisor))
- **Docker** ([Docker](https://github.com/docker))

## Demo
```
docker-compose up --build

App:
http://localhost:3001

Vault:
http://localhost:8200/ui
token: myroot
```

## Without docker-compose
**1) Build docker image**
```
docker build -t docker-react-confd:dev .
```
**2) Start docker container**

```
docker run -v ${PWD}:/app -v /app/node_modules -p 3001:3000 -e "REACT_APP_NAME=myApp" --rm docker-react-confd:dev
```
<br />
**Lets dissect this command...**
```
docker run
```
> creates a container

<br />
```
-v ${PWD}:/app
```
> Binds app directory mount a volume.

<br />
```
-v /app/node_modules
```
> Binds /app/node_modules directory as an anonymous mount volume.

<br />
```
-p 3001:3000
```
> Maps ports hostPort:containerPort

<br />
```
-e REACT_APP_ENVARNAME=envVarValue
```
> Override environment variables (.env) for debugging or testing, everything should typically be established inside `/confd` and `.env`

<br />
```
--rm
```
> removes the container when it's exited

<br />
```
docker-react-confd:dev
```
> image:tag to use for the container being created

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br>
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.<br>
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.<br>
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br>
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (Webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: https://facebook.github.io/create-react-app/docs/code-splitting

### Analyzing the Bundle Size

This section has moved here: https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size

### Making a Progressive Web App

This section has moved here: https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app

### Advanced Configuration

This section has moved here: https://facebook.github.io/create-react-app/docs/advanced-configuration

### Deployment

This section has moved here: https://facebook.github.io/create-react-app/docs/deployment

### `npm run build` fails to minify

This section has moved here: https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify
