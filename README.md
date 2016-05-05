This repository contains my template for a typical web app project. It will set up a basic express app, a grunt build system, and install common utilities and 3rd party libraries that I like, such as less, jQuery and underscore.

## Installation
Starting a new project based on this template is easy

First, git clone this repository, but override the name with you'd like for your project. You don't need to create a fork or anything as you'll later be severing ties with this repo and creating a new one.
```bash
git clone https://github.com/gpascale/static-site-boilerplate.git <project_name>
```

cd into your newly cloned project and run
```bash
setup.sh <project_name>
```

Your project is now all set up. A new git repository has been initialized in this directory and an initial commit made. At this point, it's a good idea to 

## Project Layout

The project structure is laid out as follows

- `src/` contains client-side source code (javascript, html and less files)
- `ext/` is where you should put any 3rd party source files. You'll see underscore and jQuery put there by default.
- `assets/` is where you should put images, fonts or any other static resources.

- `public/` is where the build system places your compiled app. You should never edit anything in this folder. After the build is run, `public/` contains everything needed to run the app. i.e. to deploy your app on another server, you only have to scp the `public/` folder to it.

## Running
I recommend simply using
```grunt watch```
all the time. This command starts a loop which automatically watches all source folders and automatically rebuilds and restarts the app when changes are detected.

- The build system compiles all files in `src/js` into a single file called <project_name>.js.
- All files in `src/less` are compiled into a file called <project_name>.css
- Similarly, files in `ext/js` are concatenated to a file called deps.js
- Files in `ext/css` are concatenated to a file called deps.css

The default html file, <project_name>.html includes all of the above by default.
