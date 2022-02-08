#!/bin/bash

for tar_filename in vscode-server*.tar.gz; do
    echo "##########################################################"
    echo "Found server file:  ${tar_filename}"
    vscode_commit_id="$(echo ${tar_filename} | cut -d_ -f2 | cut -d. -f1)"
    echo "Commit ID:  ${vscode_commit_id}"

    vscode_server_directory="${HOME}/.vscode-server/bin/${vscode_commit_id}"

    if [[ ! -d "${vscode_server_directory}" ]]; then
        mkdir -p "${vscode_server_directory}"
    fi

    if [[ ! -s "${vscode_server_directory}/${tar_filename}" ]]; then
        cp "${tar_filename}" "${vscode_server_directory}"
    fi
    
    pushd "${vscode_server_directory}" > /dev/null
    if [[ ! -s "node" ]]; then
        tar xvf "${tar_filename}" --strip-components=1
    fi
    popd > /dev/null

    echo
    echo "Vscode Server files installed to ${vscode_server_directory}"
done
