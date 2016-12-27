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


end

