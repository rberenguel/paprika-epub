BEGIN {
    img = ""
}

$0 ~ /^\[!\[/{
    img = $0
}

img == "" {
    print $0
}

$0 ~ /^#/ && img != "" {
    print $0
    print ""
    print img
    img = ""
}