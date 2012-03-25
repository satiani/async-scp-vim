Vim plugin to automatically SCP buffers saved in a file to a mirroring directory
on a remote host. The SCP process is invoked in the background (asynchronously)
over a multiplexed SSH connection. If the multiplexed SSH connection is not
available, the plugin will attempt to create it.
