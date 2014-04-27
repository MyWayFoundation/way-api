way-api
=======

The MyWay API (powered by StrongLoop)

Setup
=======

We are using [vagrant](http://vagrantup.com) for development of all of our projects, which gives us an easily reproducible and consistent development environment. All you need to do (after you have forked this repo and cloned it locally) is follow the [installation intructions](http://docs.vagrantup.com/v2/installation/) for vagrant and then use the `vagrant up` command from the root of the repo. NOTE: we are using VirtualBox as the VM engine, but because of how awesome vagrant is you should be able to use VMWare if you so desire.

After `vagrant up` is finished, you will have a completely provisioned VM with all of this project's dependencies installed and running. Simply use `vagrant ssh` to sign into the VM. Please see the [getting started](http://docs.vagrantup.com/v2/getting-started/index.html) section of the vagrant docs for more information on using vagrant.

**Notes about the development environment:**

 - For this project, we are using port `3000` for the application and port `8080` to run [node-inspector](https://github.com/node-inspector/node-inspector) when we want to enable real-time debugging from the browser. In our `Vagrantfile` (found in the root of the project) we are setting up port forwarding from the host machine to the VM for these ports, which allows you to hit `http://localhost:3000` (for the app) and `http://localhost:8080/debug?port=5858` (for node-inspector) in your host machine's browser. If you get any errors during `vagrant up` related to these ports, it probably means you already have something bound to one of them. 
 - Vagrant creates VMs with sensible defaults around system resources such as RAM and CPUs. If you'd like to adjust these settings after the initial VM creation, you'll first have to bring the VM down with `vagrant halt` (from project root, and from the host machine) and then use the VirtualBox (or VMWare) machine manager to adjust your VM's allocated resources (changing these settings requires the VM to be stopped). Once done, bring the VM back up with `vagrant up`. NOTE: if you use `vagrant destroy` for any reason, the VM will be completely obliterated, and the next `vagrant up` command will create a new one. If that happens you will have to adjust its resources again.
  
Running the MyWay API server
=======

To run the MyWay API server, simply do the following (assumes the `vagrant` environment is up)

 - `vagrant ssh`
 - `cd /vagrant` (note that vagrant auto-mounts the VM's `/vagrant` path to point at the folder on the host machine from which `vagrant up` was run)
 - `slc run` (we use the StrongLoop CLI to run the app)
 - now you should be able to open a browser on the host machine to `http://localhost:3000/explorer` to view the LoopBack API explorer
 
 
