const shell = require("shelljs");
const inquirer = require("inquirer");

const initSetup = async () => {
  shell.echo("UPDATING PLUGINS, UPLOADS AND DATABASE...\n");

  shell.echo("UPDATING DATABASE...");
  shell.exec("./build-scripts/updatedb.sh");

  shell.echo("GETTING UPLOADS FROM REMOTE...");
  shell.exec("./build-scripts/getUploads.sh");

  shell.echo("GETTING PLUGINS FROM REMOTE...");
  shell.exec("./build-scripts/getPlugins.sh");

};

initSetup();
