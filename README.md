# nc2xclip

## Goal
The goal of nc2xclip is to provide a simple way to copy text from a remote (SSH) vim session to the local/host machine without relying on X forwarding.

## How it works
The client data is yanked from VIM and shoved through netcat to the server/receiver.

The server waits for incoming data with netcat. That data is piped to xclip and made available in the primary, secondary and clipboard.

## Install
### Server (Receiver/local)
    $ cp nc2xclip ~/bin
    $ export PATH="~/bin:$PATH"

### Client (Sender/remote)
    $ cp nc2xclip.vim ~/.vim/plugin/
    $ cp get_visual_selection.vim ~/.vim/plugin/

# Usage
## Start server
    $ nc2xclip &

## Client
SSH to the remote with

    $ ssh -R 12345:localhost:12345 <remote_addr>

Then you in VIM you can yank text with with **&lt;leader&gt;y** and it will be available on the local machine.
