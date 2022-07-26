# create release branch with the version arguments given
# and push it to github
#
# Usage:
#   ./script.sh <version>
#
# Example:
#   ./script.sh 1.0.0
#
# Note:
#   The version argument must be a valid semantic version
#   (https://semver.org/spec/v2.0.0.html)
#

# check if the version argument is given
if [ -z "$1" ]; then
  echo "Usage: ./script.sh <version>"
  exit 1
fi

# create branch with name release-$version
git checkout -b release-v$1

# empty commit to this branch
git commit --allow-empty -m "Release $1"

# create draft release to this branch
git push origin release-v$1:release-v$1 --draft

# add tag v$1-dev to this draft branch
git tag v$1-dev


