const shell = require("shelljs");
const inquirer = require("inquirer");

const initSetup = async () => {
  inquirer
    .prompt([
      {
        name: "buildType",
        message: "Is this a new build?",
        type: "confirm",
        choices: ["Yes", "No"]
      }
    ])
    .then(answers => {
      let { buildType } = answers;
      if (buildType) {

        shell.echo("BUILDING DOCKER CONTAINERS...\n");
        shell.exec("./build-scripts/build-containers.sh");

        process.stdout.write("SETTING UP LOCAL SSL.\n");
        shell.exec("./build-scripts/create-cert.sh");

        process.stdout.write("ALL DONE.\n");
        process.stdout.write("Navigate to https://localhost to start the Wordpress installation process\n");
        
      } else {
        shell.echo("BUILDING DOCKER CONTAINERS...");
        shell.exec("./build-scripts/build-containers.sh");

        process.stdout.write("SETTING UP LOCAL SSL.\n");
        shell.exec("./build-scripts/create-cert.sh");

        shell.echo("GETTING DB FROM REMOTE...");
        shell.exec("./build-scripts/getdb.sh");

        shell.echo("GETTING UPLOADS FROM REMOTE...");
        shell.exec("./build-scripts/getUploads.sh");

        shell.echo("GETTING PLUGINS FROM REMOTE...");
        shell.exec("./build-scripts/getPlugins.sh");

        shell.echo("UPDATING DATABASE...");
        shell.exec("./build-scripts/updatedb.sh");
      }
    });
};

initSetup();
