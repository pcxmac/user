# https://gist.github.com/samdeane/3394771

if ! [[ -e .git ]]; then
echo "Run this script from the root of your git repo."
exit 1
fi

# *** REPLACE THESE WITH YOUR OLD AND NEW PATHS ***
oldpath=/root-new
newpath=/root

cmd="sed -i.gitbak s|$oldpath|$newpath|g"
find . -name .git -type f -exec $cmd {} \;
find . -name config -type f -exec $cmd {} \;
find . -name .git.gitbak -type f -exec rm {} \;
find . -name config.gitbak -type f -exec rm {} \;
