# vscode_server_install

## Steps
- [LOCAL] Copy over the VSCODE_SERVER_FILES.tar.gz to the remote host
	- scp VSCODE_SERVER_FILES.tar.gz REMOTEUSER@REMOTEHOST:/home/REMOTEUSER
- [LOCAL] SSH into the remote host
	- ssh REMOTEUSER@REMOTEHOST
- [REMOTE] Extract the VSCODE_SERVER_FILES.tar.gz
	- tar xvf VSCODE_SERVER_FILES.tar.gz
	- cd VSCODE_SERVER_FILES
- [REMOTE] Run the install script
	- ./install_vscode_server.sh
- [LOCAL] Open Vscode on your local computer
	- In Extensions tab, install the "Remote-SSH" extension
	- In bottom left corner, click the squiggle icon
	- Click 'Connect to Host'
	- Enter command for example: "ssh REMOTEUSER@REMOTEHOST"


## Manually download the vscode-server .tar.gz file
```bash
# We need our specific vscode commit it in order to download the right vscode server file
# [LOCAL] Open vscode on your local computer
# Click Help > About
# and copy and paste the 'Commit: '

# Set the bash variable to what we copy and pasted
VSCODE_COMMIT_ID='COPY_AND_PASTED_COMMIT_ID'


# Download the vscode-server tar.gz file
## (Linux):  https://update.code.visualstudio.com/commit:${VSCODE_COMMIT_ID}/server-linux-x64/stable
## (Windows):  https://update.code.visualstudio.com/commit:${VSCODE_COMMIT_ID}/server-win32-x64/stable


# EXAMPLE LINK (Linux):  https://update.code.visualstudio.com/commit:899d46d82c4c95423fb7e10e68eba52050e30ba3/server-linux-x64/stable
# EXAMPLE LINK (Windows):  https://update.code.visualstudio.com/commit:5554b12acf27056905806867f251c859323ff7e9/server-win32-x64/stable


# (Linux) The vscode server files should be extracted in this directory:  $HOME/.vscode-server/bin/${VSCODE_COMMIT_ID}
# (Windows) The vscode server files should be extracted in this directory:  %userprofile%\.vscode-server\bin\${VSCODE_COMMIT_ID}

```



## To install Vscode Extensions on a host without internet access
- Go to the extension webpage in the browser
  - e.g. https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit
- On right side of page, under *Resources*, click on *Download Extension*
- [Local] Open Vscode on your local computer.  Connect to the remote host by clicking on squiggle icon in bottom left corner, and clicking Connect to Host
- [Local VSCODE connected to Remote] Transfer the downloaded .vsix file to the remote host that does not have internet access (via `scp` or drag and drop local file to the Vscode Window connected to the Remote Host)
- [Local VSCODE connected to Remote] Go to extensions tab in the sidebar, click the 3 dots (e.g. "..."), and click "Install from VSIX..."
  - select the .vsix file that should now be on the Remote host to install it
