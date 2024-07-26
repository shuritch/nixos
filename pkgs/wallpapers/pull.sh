#! /usr/bin/env nix-shell
#! nix-shell -i bash -p jq httpie

function fetch_image() {
    local ext="$(echo $1 | cut -d '|' -f 2 | cut -d '/' -f 2)"
    local filename="$(echo $1 | cut -d '|' -f 1)"
    local id="$(echo $1 | cut -d '|' -f 3)"
    local file="$filename.$ext"
    jq -n \
        --arg name $filename --arg id $id --arg ext $ext --arg file $file \
        --arg sha256 "$(nix-prefetch-url https://i.imgur.com/$file)" \
        '{"name": $name, "ext": $ext, "id": $id, "sha256": $sha256, "file": $file}'
}

album="MuId2em" # https://imgur.com/a/MuId2em
clientid="42ce45caa10d878"
#ed4291998b8c2ef119d086fbd241935bd64c9236

data=$(https api.imgur.com/3/album/$album Authorization:"Client-ID $clientid")
images=$(echo $data | jq -r '.data.images[] | "\(.description)|\(.type)|\(.id)"')

result="["
while read -r image; do
    if [[ "$result" != "[" ]] then
        result="$result,"
    fi
    result="$result$(fetch_image $image)"
done <<< "$images"
wait

jq -n "$result]";
