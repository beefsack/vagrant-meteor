vagrant-meteor
==============

vagrant-meteor is a tool to help run Meteor silently in a VM to ease
installation and usage.

vagrant-meteor uses [Vagrant](http://www.vagrantup.com/) to create an Ubuntu
image, install Meteor and other required packages, and expose it to the user.

Installation
------------

First, use Git to clone this repo to your computer somewhere, or [download the
repo](https://github.com/beefsack/vagrant-meteor/archive/master.zip) and extract
somewhere.

Then, install [Vagrant](http://downloads.vagrantup.com/) and
[VirtualBox](https://www.virtualbox.org/wiki/Downloads).  VirtualBox is used to
run the VM silently in the background.

Usage
-----

Use your command line to change to the directory where you cloned or extracted
this repo earlier, ie. `cd ~/vagrant-meteor`.

Start Vagrant to create and run the VM using `vagrant up`.  This will download
Ubuntu and configure the VM automatically, and can take a few minutes.

Connect into the VM by using `vagrant ssh`.  This will connect you into the
image, with zsh as the shell.

You can now create a project to start working on using `mrt create my-app`.
[Meteorite](http://oortcloud.github.io/meteorite/) is installed to make meteor
and meteor package management much simpler, so it may be better to use the `mrt`
command in general instead of the `meteor` command, though you can use either.

Once you have created the project, you will notice a `my-app` directory will
have appeared in your vagrant-meteor directory.  You can edit the code inside
this directory as it is automatically synced into the VM.

You can run the app inside the VM by running `cd my-app` and `mrt`.  Your local
port 3000 is redirected into the Vagrant VM, so when you are running meteor
apps, you can open a web browser and navigate to http://localhost:3000 to view
it.

When you are finished doing work, you can use `vagrant halt` to stop the VM.
