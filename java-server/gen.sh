#!/bin/bash

PROTO_PATH="../Proto"
/usr/local/bin/protoc "$PROTO_PATH/source/"* --java_out="$PROTO_PATH/generated/java" --proto_path="$PROTO_PATH"