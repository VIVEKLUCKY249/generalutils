sed '/^$/d;s/ /\//g' struct.txt | xargs mkdir -p

: <<'COMMENT'
Below is the example "struct.txt" for creating dir-tree structure
Modules
Modules Package Module
Modules Package Module app etc modules
Modules Package Module app code community
Modules Package Module app locale
Modules Package Module app design frontend base default layout
Modules Package Module app design frontend base default template
Modules Package Module skin frontend base default layout
Modules Package Module skin frontend base default template
COMMENT
