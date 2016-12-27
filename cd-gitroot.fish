function __cdgitroot_usage
    echo 'Usage: cd-gitroot [PATH]'
    echo 'Jump to git repository\'s root directory.'
    echo 'If PATH is specified, it\'s recognized as relative path'
    echo 'from repository\'s root directory. And jump to it.'
end

function cd-gitroot -d 'Jump to git repo\'s root'
    if not command git rev-parse --git-dir > /dev/null ^ /dev/null
        echo 'It\'s out of working tree!' 1>&2
        return 1
    end

    set root_path (git rev-parse --show-toplevel)
    set argc (count $argv)

    if test (count $argv) -eq 0
        cd $root_path
    else if test (count $argv) -eq 1; and test -n $relative_path
        set relative_path $argv
        cd "$root_path/$relative_path"
    else
        __cdgitroot_usage
    end
end

