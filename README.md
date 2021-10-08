# safex-rpc-node
Docker: <a href="https://hub.docker.com/r/safexninja/safex-rpc-node">hub.docker.com/r/safexninja/safex-rpc-node</a><br>
This will run the daemon from <a href="https://github.com/safex/safexcore" target="_blank">Safex Core</a> as an RPC node. No mining. The in/out peers are set to 50.<br>
To receive <b>in</b>-peers make sure port range 17400-17403 is open on the router/network and if needed portforwarded to the docker-host, or the host is connected to the internet directly. When the node is running type <code>status</code> to see the synchronization status and the amount of peers.<br><br>
Be aware: when starting the node for the fist time it will start synchronizing with the network. This may take up to a few hours on high end hardware, and multiple days on low end hardware<br>

<h1>Supported Tags</h1>
<ul>
<li><code>latest</code></li>
<li><code>7.0.2</code></li>
</ul>
<br>
<h1>Runing the node</h1><br>
You need to specify your external/public ip adress in the commandline!
<br>
<h2>With default data location</h2><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -e RPC_IP=<i>[your external ip address]</i> safexninja/safex-rpc-node</code>

<br><h2>Recommended: With mount local volume (on the host) to /data folder in the container</h2>
<code>$ docker run -i -p 17400-17403:17400-17403 -v [volume]:/data -e RPC_IP=<i>[your external ip address]</i> safexninja/safex-rpc-node</code><br><br><br>
<b>example linux/mac</b><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/home/.safex</b>:/data -e RPC_IP=<i>[your external ip address]</i> safexninja/safex-rpc-node</code><br>
this will persist the blockchain data in <i>/home/.safex</i> on the host<br><br>
<b>example windows</b><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/c/data/.safex</b>:/data -e RPC_IP=<i>[your external ip address]</i> safexninja/safex-rpc-node</code><br>
this will persist the blockchain data in <i>c:/data/.safex</i> on the host<br>

<br>
<h1>Help & Commands</h1>
While the node is running type <code>help</code> to get a list of available commands<br>
<br>

<h1>Exit</h1>
To exit the node type <code>save</code> followed by <code>exit</code>. The container will be exited<br>
<br>
<h1>Installing Docker & Runing the node</h1>
Installing Docker on Ubuntu and run the latest node.<br>
If you have not installed docker yet, follow these steps:<br><br>

<code>$ sudo apt update</code><br>
<code>$ sudo apt install snapd</code><br>
<code>$ sudo snap install docker</code><br>
<code>$ docker run -i -p 17400-17403:17400-17403 -v <b>/home/.safex</b>:/data -e RPC_IP=<i>[your external ip address]</i> safexninja/safex-rpc-node</code><br>
<br>
If you have docker installed already (i.e. Docker Desktop on Mac), then just run the last command only
