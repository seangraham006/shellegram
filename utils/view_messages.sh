#! /bin/bash

folder="./chats"

view_messages() {
	ls -t "$folder" | head -n 5
}

view_messages
