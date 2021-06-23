# Go Wiki

Mason's work following on the [Go Writing Web Applications Tutorial](https://golang.org/doc/articles/wiki/)

## Make Commands

Use the following `make` commands in the root directory of the project

* `make`: The default target, which is also available via `make help`, lists the usage and available targets
* `make clean`: The `clean` target will delete the existing Docker image if it exists
* `make build`: The `build` target will create a new Docker image
* `make run`: The `run` target will start the application in a new container
* `make debug`: The `debug` target will start the application in a new container in debug mode

## Using the App

Once the application is started, you can visit `localhost:8080` to view the app

## Debugging the App

To debug the application in Visual Studio Code:

* Open `wiki.go`
* Place a breakpoint (anywhere is fine, you just need one placed before you start)
* Start the application (you can use the `make` commands listed above)
* Create and start a launch configuration like the one below
* During debugging, do not disconnect or restart the debugger, otherwise you will need to restart the application to re-attach

## Sample Launch Configuration

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Go Wiki",
      "type": "go",
      "request": "attach",
      "mode": "remote",
      "substitutePath": [
        {
          "from": "${workspaceFolder}/",
          "to": "/go/src/gowiki/"
        }
      ],
      "port": 4040,
      "showLog": true,
      "apiVersion": 2
    }
  ]
}
```
